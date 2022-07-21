import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/constants/color_palette.dart';
import 'package:flutter/material.dart';

import '../cubit/shopping_cubit.dart';
import '../cubit/shopping_state.dart';
import '../dashboardWidgets/shoesWidget.dart';

class Shoes extends StatefulWidget {
  @override
  _ShoesState createState() => _ShoesState();
}

String username = 'walid barakat';
String category = 'shoes';

class _ShoesState extends State<Shoes> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      BlocProvider(
        create: (context) =>
        ShoppingCubit()..CheckFollow('Shop Number One', category, username),
        child: BlocConsumer<ShoppingCubit, ShoppingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ShoesWidget(
                imgPath: 'assets/images/shoes1.png',
                bgColor: ColorPalette().secondSlice,
                shopName: 'Shop Number One',
                ReviewsCount: 60,
                reviewsStars: 4,
                index: 'shoes1');
          },
        ),
      ),
      BlocProvider(
        create: (context) =>
        ShoppingCubit()..CheckFollow('Shop Number Two', category, username),
        child: BlocConsumer<ShoppingCubit, ShoppingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ShoesWidget(
                imgPath: 'assets/images/shoes2.png',
                bgColor: ColorPalette().firstSlice,
                shopName: 'Shop Number Two',
                ReviewsCount: 50,
                reviewsStars: 3,
                index: 'shoes2');
          },
        ),
      ),
    ]);
  }
}
