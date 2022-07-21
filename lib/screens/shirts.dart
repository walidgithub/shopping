import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/constants/color_palette.dart';
import 'package:flutter/material.dart';

import '../cubit/shopping_cubit.dart';
import '../cubit/shopping_state.dart';
import '../dashboardWidgets/shirtsWidget.dart';

class Shirts extends StatefulWidget {
  @override
  _ShirtsState createState() => _ShirtsState();
}

String username = 'walid barakat';
String category = 'shirts';

class _ShirtsState extends State<Shirts> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      BlocProvider(
        create: (context) =>
        ShoppingCubit()..CheckFollow('Shop Number One', category, username),
        child: BlocConsumer<ShoppingCubit, ShoppingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ShirtsWidget(
                imgPath: 'assets/images/shirt4.png',
                bgColor: ColorPalette().secondSlice,
                shopName: 'Shop Number One',
                ReviewsCount: 60,
                reviewsStars: 4,
                index: 'shirts1');
          },
        ),
      ),
      BlocProvider(
        create: (context) =>
        ShoppingCubit()..CheckFollow('Shop Number Two', category, username),
        child: BlocConsumer<ShoppingCubit, ShoppingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ShirtsWidget(
                imgPath: 'assets/images/shirt2.png',
                bgColor: ColorPalette().firstSlice,
                shopName: 'Shop Number Two',
                ReviewsCount: 50,
                reviewsStars: 3,
                index: 'shirts2');
          },
        ),
      ),
    ]);
  }
}
