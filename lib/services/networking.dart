import 'package:http/http.dart' as dartHttp;
import 'dart:convert';

class Http {
  final String url;
  Http(this.url);

  Future get() async {
    dartHttp.Response response = await dartHttp.get(url);
    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        print(e);
        return null;
      }
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
