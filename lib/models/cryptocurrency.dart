class Cryptocurrency{
  int id;
  String name;
  String symbol;
  String slug;
  int rank;
  int isActive;
  DateTime firstHistoricalDate;
  DateTime lastHistoricalDate;
  Platform platform;

  Cryptocurrency.fromMap(Map<String, dynamic> cryptocurrencyMap){
    id = cryptocurrencyMap['id'];
    name = cryptocurrencyMap['name'];
    symbol = cryptocurrencyMap['symbol'];
    slug = cryptocurrencyMap['slug'];
    rank = cryptocurrencyMap['rank'];
    isActive = cryptocurrencyMap['is_active'];

    String firstDateString = cryptocurrencyMap['first_historical_data'];
    String firstDate = firstDateString.split('T')[0];
    firstHistoricalDate = DateTime.parse(firstDate);

    String lastDateString = cryptocurrencyMap['last_historical_data'];
    String lastDate = lastDateString.split('T')[0];
    lastHistoricalDate = DateTime.parse(lastDate);

    if(cryptocurrencyMap['platform'] != null){
      platform = Platform.fromMap(cryptocurrencyMap['platform']);
    }

  }
}

class Platform {
  int id;
  String name;
  String symbol;
  String slug;
  String tokenAddress;

  Platform.fromMap(Map<String,dynamic> platformMap){
    id = platformMap['id'];
    name = platformMap['name'];
    symbol = platformMap['symbol'];
    slug = platformMap['slug'];
    tokenAddress = platformMap['tokenAddress'];
  }

}

