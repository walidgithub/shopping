import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_palette.dart';
import '../cubit/shopping_cubit.dart';
import '../cubit/shopping_state.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController productDescController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  bool? loading;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    ShoppingCubit Cubit = ShoppingCubit.get(context);

    return BlocConsumer<ShoppingCubit, ShoppingState>(
        listener: (context, state) {
      if (state is BeforeAddingLoadingState) {
        if (!loading!) {
          LoadingDialog.show(context);
          loading = true;
        }
      } else {
        if (loading!) {
          LoadingDialog.hide(context);
          loading = false;
        }
      }
    }, builder: (context, state) {
      return SafeArea(
        child: Scaffold(
            body: Stack(children: [
          Container(
              height: screenHeight,
              width: screenWidth,
              color: Colors.transparent),
          Container(
              height: screenHeight,
              width: screenWidth,
              color: ColorPalette().leftBarColor),
          Container(
              height: screenHeight - 110,
              width: screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 240,
                    ),
                    Container(
                      height: 50.0,
                      width: screenWidth - 20,
                      child: TextFormField(
                        controller: shopNameController,
                        autofocus: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.4)),
                            ),
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10.0),
                            hintText: 'Shop Name...',
                            hintStyle: GoogleFonts.bigShouldersText(
                                color: Color(0xFF97A9AC), fontSize: 20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50.0,
                      width: screenWidth - 20,
                      child: TextFormField(
                        controller: productCategoryController,
                        // readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.4)),
                            ),
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10.0),
                            hintText: 'Product Category....',
                            labelText: 'bags or shoes or shirts or accessory or jeans',
                            hintStyle: GoogleFonts.bigShouldersText(
                                color: Color(0xFF97A9AC), fontSize: 20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50.0,
                      width: screenWidth - 20,
                      child: TextFormField(
                        controller: productDescController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.4)),
                            ),
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10.0),
                            hintText: 'Product Description...',
                            hintStyle: GoogleFonts.bigShouldersText(
                                color: Color(0xFF97A9AC), fontSize: 20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50.0,
                      width: 200,
                      child: TextFormField(
                        controller: productPriceController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.4)),
                            ),
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10.0),
                            hintText: 'Product Price...',
                            hintStyle: GoogleFonts.bigShouldersText(
                                color: Color(0xFF97A9AC), fontSize: 20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                         await Cubit.Image();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: ColorPalette().buttonColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                        child: Text(
                          'Choose a (.PNG) photo',
                          style: GoogleFonts.bigShouldersText(
                              color: ColorPalette().leftBarColor,
                              fontSize: 20.0),
                        ))
                  ],
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: Colors.white)),
          Container(
              height: (screenHeight / 4 + 25.0),
              width: screenWidth,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/shopping2.png'),
                      fit: BoxFit.cover))),
          Container(
              height: (screenHeight / 4 + 25.0),
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: Colors.white.withOpacity(0.4))),
          Container(
              height: (screenHeight / 4 + 25.0),
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: ColorPalette().secondSlice)),
          Positioned(
              top: 20.0,
              left: 20.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              )),
          Positioned(
              top: screenHeight - 100,
              left: screenWidth / 4,
              child: ElevatedButton(
                  onPressed: () async {
                    loading = false;
                    await Cubit.addProduct(
                        shopNameController.text,
                        productDescController.text,
                        productPriceController.text,
                        productCategoryController.text);
                    loading = true;
                    shopNameController.clear();
                    productDescController.clear();
                    productPriceController.clear();
                    productCategoryController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorPalette().buttonColor,
                    padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
                  ),
                  child: Text(
                    'Save',
                    style: GoogleFonts.bigShouldersText(
                        color: ColorPalette().leftBarColor, fontSize: 20.0),
                  ))),
          Positioned(
              top: 150,
              left: 100,
              child: Text(
                'Add Product',
                style: GoogleFonts.bigShouldersText(
                    color: Colors.white, fontSize: 40.0),
              ))
        ])),
      );
    });
  }
}

class LoadingDialog extends StatefulWidget {
  static void show(BuildContext context) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.of(context).pop();

  LoadingDialog() : super();

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            color: Colors.transparent,
            width: 80,
            height: 80,
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
