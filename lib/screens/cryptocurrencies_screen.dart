import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycrypto/bloc/favourite_cubit.dart';
import 'package:mycrypto/models/cryptocurrency.dart';
import 'package:mycrypto/screens/tabs/all_cryptocurrencies_tab.dart';
import 'package:mycrypto/screens/tabs/favourite_cryptocurrencies_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Cryptocurrency> _cryptocurrenciesList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'MyCrypto',
            style: TextStyle(
              color: Colors.green[800],
            ),
          ),
          centerTitle: true,
          elevation: 4,
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.green,
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllCryptocurrenciesTab(
              cryptoCurrenciesList: _cryptocurrenciesList,
            ),
            FavouriteCryptocurrenciesTab(
              cryptocurrenciesList: _cryptocurrenciesList,
            ),
          ],
        ),
      ),
    );
  }
}
