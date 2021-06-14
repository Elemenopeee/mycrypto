import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycrypto/bloc/favourite_cubit.dart';
import 'package:mycrypto/models/cryptocurrency.dart';
import 'package:mycrypto/screens/cryptocurrencies_screen.dart';
import 'package:mycrypto/screens/cryptocurrency_details_screen.dart';
import 'package:mycrypto/screens/splash_screen.dart';
import 'package:mycrypto/utilities/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: FavouriteCubit(<Cryptocurrency>[]),
      child: MaterialApp(
        title: 'MyCrypto',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: SPLASH_SCREEN_ROUTE,
        routes: {
          SPLASH_SCREEN_ROUTE: (context) => SplashScreen(),
          HOME_SCREEN_ROUTE: (context) => HomeScreen(),
          CRYPTOCURRENCY_DETAILS_SCREEN: (context) =>
              CryptocurrencyDetailsScreen(),
        },
      ),
    );
  }
}
