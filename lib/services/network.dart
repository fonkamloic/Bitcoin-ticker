import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future<double> getData({String url}) async {
    http.Response data = await http.get(url);
    print(data.body);
    dynamic decodeData = jsonDecode(data.body);
    return decodeData['last'];
  }
}
