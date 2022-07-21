import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping/cubit/shopping_state.dart';

import '../models/CartModel.dart';
import '../models/ProductModel.dart';
import '../models/ShopFollowerModel.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  ShoppingCubit() : super(ShoppingInitial());

  static ShoppingCubit get(context) => BlocProvider.of(context);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseStorage storage = FirebaseStorage.instance;

  ProductModel productModel = ProductModel();

  // ShopFollowerModel shopFollowerModel = ShopFollowerModel();

  List<ProductModel> Products = [];

  List<ShopFollowerModel> AllFollowers = [];

  List<CartModel> AllCarts = [];

  bool? ifFollower = false;

  bool? inTheCart = false;

  int CartItemsCount = 0;

  ImagePicker imagePicker = ImagePicker();
  XFile? PImage;

  Image() async {
    PImage = await imagePicker.pickImage(source: ImageSource.gallery);
    return PImage?.readAsBytes();
  }

// Add Product ***********************
  addProduct(String shopName, String productName, String productPrice,
      String productCategory) async {
    ProductModel productModel = ProductModel(
        shopName: shopName,
        productName: productName,
        productPrice: productPrice,
        productCategory: productCategory);

    emit(BeforeAddingLoadingState());

    await storage
        .ref()
        .child("photos/")
        .child('${productModel.shopName}${productModel.productName}.jpg')
        .putFile(File(PImage!.path));
    productModel.productImage = await storage
        .ref()
        .child("photos/")
        .child('${productModel.shopName}${productModel.productName}.jpg')
        .getDownloadURL();

    await firestore.collection('product').doc().set(productModel.toJson());

    emit(AddProductState());
  }

  getProducts(String shopName, String shopCategory) async {
    Products = [];
    emit(LoadingProductsState());
    var docs = await firestore
        .collection('product')
        .where('shopName', isEqualTo: shopName)
        .where('productCategory', isEqualTo: shopCategory)
        .get();

    docs.docs.forEach((element) {
      Products.add(ProductModel.fromJson(element.data()));
      // print(Products.length);
    });
    emit(GetProductsState());
  }

  // Follow **************
  addFollow(
      String id, String shopName, String shopCategory, String follower) async {
    ShopFollowerModel shopFollowerModel = ShopFollowerModel(
        id: id,
        shopName: shopName,
        shopCategory: shopCategory,
        follower: follower);

    await firestore
        .collection('shopfollower')
        .doc()
        .set(shopFollowerModel.toJson());

    emit(AddFollowState());
  }

  CheckFollow(String shopName, String shopCategory, String follower) async {
    AllFollowers = [];
    var docs = await firestore
        .collection('shopfollower')
        .where('shopName', isEqualTo: shopName)
        .where('shopCategory', isEqualTo: shopCategory)
        .where('follower', isEqualTo: follower)
        .get();

    //check if found
    docs.docs.forEach((element) {
      AllFollowers.add(ShopFollowerModel.fromJson(element.data()));
    });

    if (AllFollowers.length > 0) {
      ifFollower = true;
    } else {
      ifFollower = false;
    }

    emit(CheckFollowState());
  }

  ToggleFollow(
      String id, String shopName, String shopCategory, String follower) async {
    CheckFollow(shopName, shopCategory, follower);

    if (ifFollower!) {
      await firestore
          .collection('shopfollower')
          .where('id', isEqualTo: id)
          .get()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
      ifFollower = false;
    } else {
      addFollow(id, shopName, shopCategory, follower);
      ifFollower = true;
    }

    emit(ToggleFollowState());
  }

//Add to cart  *******************

  addToCart(String shopName, String productName, String productPrice,
      String productCategory, String productImage, String userName) async {
    CartModel cartModel = CartModel(
        shopName: shopName,
        productName: productName,
        productPrice: productPrice,
        productCategory: productCategory,
        productImage: productImage,
        userName: userName);

    await firestore.collection('cart').doc().set(cartModel.toJson());

    emit(AddToCartState());
  }

  CheckAddToCart(String shopName, String productName, String productCategory,
      String userName) async {
    AllCarts = [];
    var docs = await firestore
        .collection('cart')
        .where('shopName', isEqualTo: shopName)
        .where('productName', isEqualTo: productName)
        .where('productCategory', isEqualTo: productCategory)
        .where('userName', isEqualTo: userName)
        .get();

    //check if found
    docs.docs.forEach((element) {
      AllCarts.add(CartModel.fromJson(element.data()));
    });

    if (AllCarts.length > 0) {
      inTheCart = true;
    } else {
      inTheCart = false;
    }

    emit(CheckAddToCartState());
  }

  ToggleAddToCart(String shopName, String productName, String productPrice,
      String productCategory, String productImage, String userName) async {
    CheckAddToCart(shopName, productName, productCategory, userName);

    if (inTheCart!) {
      await firestore
          .collection('cart')
          .where('userName', isEqualTo: userName)
          .where('productName', isEqualTo: productName)
          .where('shopName', isEqualTo: shopName)
          .where('productCategory', isEqualTo: productCategory)
          .get()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
      inTheCart = false;
    } else {
      addToCart(shopName, productName, productPrice, productCategory,
          productImage, userName);
      inTheCart = true;
    }

    emit(ToggleAddToCartState());
  }

  GetCountInCart(String userName) async {
    await firestore
        .collection('cart')
        .where('userName', isEqualTo: userName)
        .get()
        .then((snapshot) {
      CartItemsCount = snapshot.docs.length;
    });

    emit(CountInCartState());
  }
}
