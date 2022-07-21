import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/cubit/shopping_state.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../constants/color_palette.dart';
import '../cubit/shopping_cubit.dart';
import '../details/bagsdetails.dart';

class BagsWidget extends StatefulWidget {
  final imgPath, shopName, index;
  Color bgColor;
  int ReviewsCount;
  double reviewsStars;



  BagsWidget(
      {required this.imgPath,
      required this.bgColor,
      required this.shopName,
      required this.ReviewsCount,
      required this.reviewsStars,
      required this.index});

  @override
  State<BagsWidget> createState() => _BagsWidgetState();
}

class _BagsWidgetState extends State<BagsWidget> {
  String category = 'bags';
  String username = 'walid barakat';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit, ShoppingState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BagsDetails(
                  imgPath: widget.imgPath,
                  headerColor: widget.bgColor,
                  shopName: widget.shopName,
                  rating: widget.reviewsStars,
                  shopCategory: category,
                  index: widget.index,
                  aboutUs: widget.shopName + ' is a good place for shopping')));
        },
        child: Stack(
          children: [
            Container(
                height: 300.0,
                width: 250.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.transparent)),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                            image: AssetImage('assets/images/shopping2.png'),
                            fit: BoxFit.cover)))),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white.withOpacity(0.4),
                    ))),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: widget.bgColor.withOpacity(0.8),
                    ))),
            Positioned(
                right: 2.0,
                child: Hero(
                    tag: widget.imgPath,
                    child: Container(
                        height: 250.0,
                        width: 150.0,
                        child: Image(
                            image: AssetImage(widget.imgPath),
                            fit: BoxFit.scaleDown)))),
            Positioned(
                top: 125.0,
                left: 15.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80.0),
                      Text(
                        widget.shopName,
                        style: GoogleFonts.bigShouldersText(
                            color: Color(0xFF23163D), fontSize: 27.0),
                      ),
                      SizedBox(height: 2.0),
                      Container(
                          width: 200.0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.ReviewsCount} reviews',
                                        style: GoogleFonts.bigShouldersText(
                                            color: ColorPalette().titleColor,
                                            fontSize: 15.0),
                                      ),
                                      SmoothStarRating(
                                          starCount: 5,
                                          size: 20.0,
                                          color: ColorPalette().buttonColor,
                                          borderColor:
                                              ColorPalette().buttonColor,
                                          rating: widget.reviewsStars)
                                    ]),
                                GestureDetector(
                                    onTap: () async {
                                      await ShoppingCubit.get(context)
                                          .ToggleFollow(
                                              widget.index,
                                              widget.shopName,
                                              category,
                                              username);
                                    },
                                    child: Container(
                                        width: 75.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          color: ColorPalette().buttonColor,
                                        ),
                                        child: ShoppingCubit.get(context)
                                                .ifFollower!
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                    Icon(
                                                      Icons.check,
                                                      size: 17.0,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 5.0),
                                                    Text(
                                                      'Followed',
                                                      style: GoogleFonts
                                                          .bigShouldersText(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15.0),
                                                    )
                                                  ])
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                    Icon(
                                                      Icons.favorite,
                                                      size: 17.0,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 5.0),
                                                    Text(
                                                      'Follow',
                                                      style: GoogleFonts
                                                          .bigShouldersText(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15.0),
                                                    )
                                                  ])))
                              ]))
                    ]))
          ],
        ));
  },
);
  }
}
