import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycrypto/bloc/favourite_cubit.dart';
import 'package:mycrypto/models/cryptocurrency.dart';
import 'package:mycrypto/screens/widgets/cryptocurrency_information_tile.dart';

class FavouriteCryptocurrenciesTab extends StatefulWidget {
  const FavouriteCryptocurrenciesTab({Key key, this.cryptocurrenciesList}) : super(key: key);
  final List<Cryptocurrency> cryptocurrenciesList;

  @override
  _FavouriteCryptocurrenciesTabState createState() =>
      _FavouriteCryptocurrenciesTabState();
}

class _FavouriteCryptocurrenciesTabState
    extends State<FavouriteCryptocurrenciesTab>
    with AutomaticKeepAliveClientMixin {
  // final _favouriteBloc = FavouriteBloc();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<FavouriteCubit, List<Cryptocurrency>>(
      builder: (context, cryptocurrenciesList) {
        return ListView.builder(
          itemCount: cryptocurrenciesList.length,
          itemBuilder: (BuildContext context, int index) {
            return CryptocurrencyInformationTile(
              key: UniqueKey(),
              cryptocurrency: cryptocurrenciesList[index],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
