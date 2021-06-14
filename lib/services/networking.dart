import 'package:http/http.dart';

class Networking{

  Future<Response> getData (String url, {Map<String, String> headers}) async {
    var response = await get(Uri.parse(url), headers: headers);

    if(response.statusCode == 200){
      return response;
    }
    else {
      return null;
    }
  }
}
