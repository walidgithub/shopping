import 'package:shopping/constants/color_palette.dart';
import 'package:shopping/details/accessorydetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/details/shoesdetails.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class Shoes extends StatefulWidget {
  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      buildListItem('assets/images/shoes1.png', ColorPalette().secondSlice,
          'Shop Number One', 40, 4),
      buildListItem('assets/images/shoes2.png', ColorPalette().firstSlice,
          'Shop Number Two', 35, 2)
    ]);
  }

  buildListItem(String imgPath, Color bgColor, String shopName,
      int ReviewsCount, double reviewsStars) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ShoesDetails(
                    imgPath: imgPath,
                    headerColor: bgColor,
                    shopName: shopName,
                    rating: reviewsStars,
                    shopCategory: 'shoes',
                    aboutUs: shopName + ' is a good place for shopping',
                  )));
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
                      color: bgColor.withOpacity(0.8),
                    ))),
            Positioned(
                right: 2.0,
                child: Hero(
                    tag: imgPath,
                    child: Container(
                        height: 250.0,
                        width: 150.0,
                        child: Image(
                            image: AssetImage(imgPath),
                            fit: BoxFit.scaleDown)))),
            Positioned(
                top: 125.0,
                left: 15.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80.0),
                      Text(
                        shopName,
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
                                        '$ReviewsCount reviews',
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
                                          rating: reviewsStars)
                                    ]),
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        width: 75.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          color: ColorPalette().buttonColor,
                                        ),
                                        child: Row(
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
                                                        color: Colors.white,
                                                        fontSize: 15.0),
                                              )
                                            ])))
                              ]))
                    ]))
          ],
        ));
  }
}