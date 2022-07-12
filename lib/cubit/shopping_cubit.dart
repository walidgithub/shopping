import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping/cubit/shopping_state.dart';

import '../models/ShopModel.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  ShoppingCubit() : super(ShoppingInitial());

  static ShoppingCubit get(context) => BlocProvider.of(context);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseStorage storage = FirebaseStorage.instance;

  ShopModel shopModel = ShopModel();

  List<ShopModel> Products = [];

  ImagePicker imagePicker = ImagePicker();
  XFile? PImage;

  Image() async {
    PImage = await imagePicker.pickImage(source: ImageSource.gallery);
    return PImage?.readAsBytes();
  }

  addProduct(String shopName, String productName, String productPrice,
      String productCategory) async {
    ShopModel shopModel = ShopModel(
        shopName: shopName,
        productName: productName,
        productPrice: productPrice,
        productCategory: productCategory);

    emit(BeforeAddingLoadingState());

    await storage
        .ref()
        .child("photos/")
        .child('${shopModel.shopName}${shopModel.productName}.jpg')
        .putFile(File(PImage!.path));
    shopModel.productImage = await storage
        .ref()
        .child("photos/")
        .child('${shopModel.shopName}${shopModel.productName}.jpg')
        .getDownloadURL();

    await firestore.collection('product').doc().set(shopModel.toJson());

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
      Products.add(ShopModel.fromJson(element.data()));
      // print(Products.length);
    });
    emit(GetProductsState());
  }
}
