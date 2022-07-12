import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/firebase_options.dart';
import 'package:shopping/screens/dashboard.dart';

import 'cubit/shopping_cubit.dart';
import 'cubit/shopping_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ShoppingCubit())
      ],
      child: BlocConsumer<ShoppingCubit, ShoppingState>(
          listener: (context, state) => {},
          builder: (c, s) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: DashboardPage(),
              )),
    );
  }
}
