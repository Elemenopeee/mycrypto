import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mycrypto/bloc/favourite_cubit.dart';
import 'package:mycrypto/models/cryptocurrency.dart';

class CryptocurrencyDetailsScreen extends StatefulWidget {
  const CryptocurrencyDetailsScreen({Key key, this.cryptocurrencyList})
      : super(key: key);
  final List<Cryptocurrency> cryptocurrencyList;

  @override
  _CryptocurrencyDetailsScreenState createState() =>
      _CryptocurrencyDetailsScreenState();
}

class _CryptocurrencyDetailsScreenState
    extends State<CryptocurrencyDetailsScreen> {
  Cryptocurrency _cryptocurrency;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _cryptocurrency = ModalRoute.of(context).settings.arguments;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Center(
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  spreadRadius: 2,
                  blurRadius: 20,
                ),
              ],
            ),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(
                CupertinoIcons.chevron_back,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
      body: _cryptocurrency == null
          ? Center(
              child: Text('Please wait...'),
            )
          : SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.white,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          radius: 1,
                          colors: [
                            Colors.green[700],
                            Colors.green[900],
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: MediaQuery.of(context).size.height * 0.25 - 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[200],
                            child: Text(
                              _cryptocurrency.symbol,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _cryptocurrency.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${_cryptocurrency.rank}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Rank',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.bitcoin_circle,
                      ),
                    ],
                  ),
                  title: Text(
                    _cryptocurrency.slug,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle:Text(
                    'Slug',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.arrow_up_circle,
                      ),
                    ],
                  ),
                  title: Text(
                    _cryptocurrency.isActive == 1 ? 'Yes' : 'No',
                    style: TextStyle(
                      fontSize: 16,
                      color: _cryptocurrency.isActive == 1
                          ? Colors.green[700]
                          : Colors.red[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle:Text(
                    'Active',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.calendar_circle,
                      ),
                    ],
                  ),
                  title: Text(
                    DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                        .format(_cryptocurrency.firstHistoricalDate),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle:Text(
                    'First Data',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.calendar_circle,
                      ),
                    ],
                  ),
                  title: Text(
                    DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                        .format(_cryptocurrency.lastHistoricalDate),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle:Text(
                    'Last Data',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<FavouriteCubit, List<Cryptocurrency>>(
                  builder: (context, cryptocurrenciesList) {
                    bool addedToFavourites = cryptocurrenciesList.any(
                        (element) =>
                            element.id == _cryptocurrency.id ? true : false);

                    print('Added to favourites ----> $addedToFavourites');

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 4.0,
                        primary: Colors.black,
                        padding: EdgeInsets.all(16),
                      ),
                      onPressed: () {
                        if (addedToFavourites) {
                          context
                              .read<FavouriteCubit>()
                              .removeFromFavourites(_cryptocurrency);
                        } else {
                          context
                              .read<FavouriteCubit>()
                              .addToFavourites(_cryptocurrency);
                        }
                      },
                      child: Text(
                        addedToFavourites
                            ? 'Un-mark as Favourite'
                            : 'Mark as Favourite',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
    );
  }
}
