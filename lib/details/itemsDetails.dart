import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_palette.dart';
import '../cubit/shopping_cubit.dart';
import '../cubit/shopping_state.dart';

class ItemsDetails extends StatefulWidget {
  String imgpath, desc, price, category, shopName;

  ItemsDetails(
      {required this.imgpath,
      required this.desc,
      required this.price,
      required this.category,
      required this.shopName});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

String userName = 'walid barakat';

class _ItemsDetailsState extends State<ItemsDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingCubit()
        ..CheckAddToCart(
            widget.shopName, widget.desc, widget.category, userName),
      child: BlocConsumer<ShoppingCubit, ShoppingState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                    onTap: () async {
                      await ShoppingCubit.get(context).ToggleAddToCart(
                          widget.shopName,
                          widget.desc,
                          widget.price,
                          widget.category,
                          widget.imgpath,
                          userName);
                    },
                    child: Container(
                        width: 75.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: ColorPalette().buttonColor,
                        ),
                        child: ShoppingCubit.get(context).inTheCart!
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Icon(
                                      Icons.check,
                                      size: 17.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      'Added',
                                      style: GoogleFonts.bigShouldersText(
                                          color: Colors.white, fontSize: 15.0),
                                    )
                                  ])
                            : Row(
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
                            image: NetworkImage(widget.imgpath),
                            fit: BoxFit.scaleDown)))),
            Positioned(
                left: 10.0,
                top: 60.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.price,
                        style: GoogleFonts.bigShouldersText(
                            color: ColorPalette().firstSlice, fontSize: 25.0),
                      ),
                      Text(
                        widget.desc,
                        style: GoogleFonts.bigShouldersText(
                            color: Color(0xFF23163D), fontSize: 20.0),
                      )
                    ]))
          ]);
        },
      ),
    );
  }
}
