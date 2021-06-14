import 'dart:convert';

import 'package:mycrypto/models/cryptocurrency.dart';
import 'package:mycrypto/services/networking.dart';
import 'package:mycrypto/utilities/constants.dart';

const _GET_CRYPTOCURRENCY_URL = '$BASE_URL$END_POINT';

class CryptocurrencyService{

  final Networking _networking = Networking();

  var cryptocurrencyList = <Cryptocurrency>[];

  Future<void> getCryptoCurrencies(int startOffset) async {
    var response = await _networking.getData('$_GET_CRYPTOCURRENCY_URL?start=$startOffset&limit=20', headers: {
      API_KEY_KEY: API_KEY_VALUE,
    });

    if(response != null){
      var decodedResponse = jsonDecode(response.body);
      for (var cryptocurrencyMap in decodedResponse['data']){
        cryptocurrencyList.add(Cryptocurrency.fromMap(cryptocurrencyMap));
      }
    }
    else {
      return null;
    }
  }


}