import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/details/itemsDetails.dart';

import '../cubit/shopping_cubit.dart';
import '../cubit/shopping_state.dart';

class JeansDetails extends StatefulWidget {
  final imgPath, headerColor, shopName, aboutUs, shopCategory, index;
  double? rating;

  JeansDetails(
      {this.imgPath,
      this.headerColor,
      this.shopName,
      this.rating,
      this.aboutUs,
      this.index,
      this.shopCategory});

  @override
  _JeansDetailsState createState() => _JeansDetailsState();
}

class _JeansDetailsState extends State<JeansDetails> {
  String category = 'jeans';
  String username = 'walid barakat';

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => ShoppingCubit()
        ..getProducts(widget.shopName, widget.shopCategory)
        ..CheckFollow(widget.shopName, category, username)
        ..GetCountInCart(username),
      child: BlocConsumer<ShoppingCubit, ShoppingState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                  height: screenHeight / 2,
                  width: screenWidth,
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
                      color: widget.headerColor.withOpacity(0.8))),
              Positioned(
                  top: 20.0,
                  left: 30.0,
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
              const Positioned(
                  top: 20.0,
                  right: 20.0,
                  child: Icon(
                    Feather.shopping_bag,
                    color: Colors.white,
                  )),
                  Positioned(
                      top: 40.0,
                      right: 20.0,
                      child: ShoppingCubit.get(context).CartItemsCount > 0
                          ? Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            '${ShoppingCubit.get(context).CartItemsCount}',
                            style:
                            TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      )
                          : Container(
                        child: Text(''),
                      )),
              Positioned(
                  top: (screenHeight / 4 - 100.0),
                  left: screenWidth / 4,
                  child: Hero(
                      tag: widget.imgPath,
                      child: Image(
                          image: AssetImage(widget.imgPath),
                          height: 175.0,
                          width: 175.0,
                          fit: BoxFit.scaleDown))),
              Positioned(
                  top: (screenHeight / 4) + 85.0,
                  left: screenWidth / 7,
                  child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text(
                          widget.shopName,
                          style: GoogleFonts.bigShouldersText(
                              color: Color(0xFF23163D), fontSize: 24.0),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Feather.user),
                              SizedBox(width: 10.0),
                              Text(
                                '1.5k',
                                style: GoogleFonts.bigShouldersText(
                                    color: ColorPalette().firstSlice,
                                    fontSize: 20.0),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                  width: 1.0, height: 20.0, color: Colors.grey),
                              SizedBox(width: 15.0),
                              //Repeat the same block as above
                              Icon(Feather.star),
                              SizedBox(width: 15.0),
                              Text(
                                '${widget.rating}',
                                style: GoogleFonts.bigShouldersText(
                                    color: ColorPalette().firstSlice,
                                    fontSize: 20.0),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                width: 1.0,
                                height: 20.0,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 15.0),
                              Icon(Feather.eye),
                              SizedBox(width: 15.0),
                              Text(
                                '35',
                                style: GoogleFonts.bigShouldersText(
                                    color: ColorPalette().firstSlice,
                                    fontSize: 20.0),
                              ),
                            ])
                      ]))),
              Positioned(
                  top: screenHeight / 2 + 10.0,
                  left: 25.0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Us',
                          style: GoogleFonts.bigShouldersText(
                              color: Color(0xFF23163D), fontSize: 30.0),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: screenWidth - 40.0,
                          child: Text(
                            widget.aboutUs,
                            style: GoogleFonts.bigShouldersText(
                                color: Color(0xFFB5ABB8), fontSize: 15.0),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 150.0,
                          width: screenWidth,
                          padding: EdgeInsets.only(right: 30),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: false,
                            itemCount:
                                ShoppingCubit.get(context).Products.length,
                            itemBuilder: (context, index) {
                              return ItemsDetails(
                                  imgpath:
                                      '${ShoppingCubit.get(context).Products[index].productImage}',
                                  desc:
                                      '${ShoppingCubit.get(context).Products[index].productName}',
                                  price:
                                      '${ShoppingCubit.get(context).Products[index].productPrice}',
                                  category: category,
                                  shopName: widget.shopName);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              width: 10,
                            ),
                          ),
                        ),
                        Row(children: [
                          GestureDetector(
                            onTap: () async {
                              await ShoppingCubit.get(context).ToggleFollow(
                                  widget.index,
                                  widget.shopName,
                                  category,
                                  username);
                            },
                            child: Container(
                                height: 50.0,
                                width: 225.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: ColorPalette().buttonColor),
                                child: Center(
                                    child: ShoppingCubit.get(context)
                                            .ifFollower!
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                                Icon(
                                                  Icons.check,
                                                  size: 25.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5.0),
                                                Text(
                                                  'Followed',
                                                  style: GoogleFonts
                                                      .bigShouldersText(
                                                          color: Colors.white,
                                                          fontSize: 25.0),
                                                )
                                              ])
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                                Icon(
                                                  Icons.favorite,
                                                  size: 25.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5.0),
                                                Text(
                                                  'Follow',
                                                  style: GoogleFonts
                                                      .bigShouldersText(
                                                          color: Colors.white,
                                                          fontSize: 25.0),
                                                )
                                              ]))),
                          ),
                          SizedBox(width: 25.0),
                          Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: ColorPalette().buttonColor,
                                      width: 2.0)),
                              child: Center(
                                  child: Icon(Feather.bookmark, size: 17.0)))
                        ])
                      ]))
            ])),
          );
        },
      ),
    );
  }
}
