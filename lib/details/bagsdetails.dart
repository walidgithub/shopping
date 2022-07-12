import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/shopping_cubit.dart';
import '../cubit/shopping_state.dart';

class BagsDetails extends StatefulWidget {
  final imgPath, headerColor, shopName, aboutUs, shopCategory;
  double? rating;

  BagsDetails(
      {this.imgPath,
      this.headerColor,
      this.shopName,
      this.rating,
      this.aboutUs,
      this.shopCategory});

  @override
  _BagsDetailsState createState() => _BagsDetailsState();
}

class _BagsDetailsState extends State<BagsDetails> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) =>
          ShoppingCubit()..getProducts(widget.shopName, widget.shopCategory),
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
                              return buildOneItem(
                                  '${ShoppingCubit.get(context).Products[index].productPrice}',
                                  '${ShoppingCubit.get(context).Products[index].productImage}',
                                  '${ShoppingCubit.get(context).Products[index].productName}');
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              width: 10,
                            ),
                          ),
                        ),
                        Row(children: [
                          Container(
                              height: 50.0,
                              width: 225.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: ColorPalette().buttonColor),
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      'Follow',
                                      style: GoogleFonts.bigShouldersText(
                                          color: Colors.white, fontSize: 25.0),
                                    )
                                  ]))),
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

  buildOneItem(price, imgpath, desc) {
    return Stack(children: [
      Container(height: 125.0, width: 200.0, color: Colors.transparent),
      Positioned(
        top: 50.0,
        child: Container(
          height: 75.0,
          width: 200.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    color: Colors.grey.withOpacity(0.2))
              ],
              color: Colors.white),
        ),
      ),
      Positioned(
          top: 105,
          left: 110,
          child: GestureDetector(
              onTap: () {},
              child: Container(
                  width: 75.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: ColorPalette().buttonColor,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 17.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Add',
                          style: GoogleFonts.bigShouldersText(
                              color: Colors.white, fontSize: 15.0),
                        )
                      ])))),
      Positioned(
          right: 5.0,
          child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imgpath), fit: BoxFit.scaleDown)))),
      Positioned(
          left: 10.0,
          top: 60.0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              price,
              style: GoogleFonts.bigShouldersText(
                  color: ColorPalette().firstSlice, fontSize: 25.0),
            ),
            Text(
              desc,
              style: GoogleFonts.bigShouldersText(
                  color: Color(0xFF23163D), fontSize: 20.0),
            )
          ]))
    ]);
  }
}
