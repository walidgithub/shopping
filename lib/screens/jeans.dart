import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/constants/color_palette.dart';
import 'package:flutter/material.dart';

import '../cubit/shopping_cubit.dart';
import '../cubit/shopping_state.dart';
import '../dashboardWidgets/jeansWidget.dart';

class Jeans extends StatefulWidget {
  @override
  _JeansState createState() => _JeansState();
}

String username = 'walid barakat';
String category = 'jeans';

class _JeansState extends State<Jeans> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      BlocProvider(
        create: (context) =>
        ShoppingCubit()..CheckFollow('Shop Number One', category, username),
        child: BlocConsumer<ShoppingCubit, ShoppingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return JeansWidget(
                imgPath: 'assets/images/jeans5.png',
                bgColor: ColorPalette().secondSlice,
                shopName: 'Shop Number One',
                ReviewsCount: 60,
                reviewsStars: 4,
                index: 'Jeans1');
          },
        ),
      ),
      BlocProvider(
        create: (context) =>
        ShoppingCubit()..CheckFollow('Shop Number Two', category, username),
        child: BlocConsumer<ShoppingCubit, ShoppingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return JeansWidget(
                imgPath: 'assets/images/jeans6.png',
                bgColor: ColorPalette().firstSlice,
                shopName: 'Shop Number Two',
                ReviewsCount: 50,
                reviewsStars: 3,
                index: 'Jeans2');
          },
        ),
      ),
    ]);
  }
}
