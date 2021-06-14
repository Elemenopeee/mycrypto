import 'package:flutter/material.dart';
import 'package:mycrypto/models/cryptocurrency.dart';
import 'package:mycrypto/screens/widgets/cryptocurrency_information_tile.dart';
import 'package:mycrypto/services/cryptocurrency_service.dart';

class AllCryptocurrenciesTab extends StatefulWidget {
  const AllCryptocurrenciesTab({Key key, this.cryptoCurrenciesList}) : super(key: key);
  final List<Cryptocurrency> cryptoCurrenciesList;

  @override
  _AllCryptocurrenciesTabState createState() => _AllCryptocurrenciesTabState();
}

class _AllCryptocurrenciesTabState extends State<AllCryptocurrenciesTab>
    with AutomaticKeepAliveClientMixin {
  final CryptocurrencyService _cryptocurrencyService = CryptocurrencyService();
  int _startOffset = 1;

  Future<void> _futureCryptocurrencyList;

  bool _gettingMoreData = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _futureCryptocurrencyList =
        _cryptocurrencyService.getCryptoCurrencies(_startOffset);

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels && !_gettingMoreData) {
        getMoreData();
      }
    });

    super.initState();
  }

  void getMoreData() async {
    setState(() {
      _gettingMoreData = true;
    });
    await _cryptocurrencyService.getCryptoCurrencies(
        _cryptocurrencyService.cryptocurrencyList.length + 1);
    setState(() {
      _gettingMoreData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _futureCryptocurrencyList,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text('Something went wrong!'),
            );
            break;
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            return RefreshIndicator(
              displacement: 20,
              onRefresh: () async {
                setState(() {
                  _startOffset = 1;
                  _cryptocurrencyService.cryptocurrencyList.clear();
                  _futureCryptocurrencyList = _cryptocurrencyService.getCryptoCurrencies(_startOffset);
                });
              },
              child: ListView(
                controller: _scrollController,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _cryptocurrencyService.cryptocurrencyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CryptocurrencyInformationTile(
                        key: UniqueKey(),
                        cryptocurrency:
                        _cryptocurrencyService.cryptocurrencyList[index],
                      );
                    },
                  ),
                  _gettingMoreData
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : SizedBox(),
                ],
              ),
            );
            break;
          default:
            return SizedBox();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}