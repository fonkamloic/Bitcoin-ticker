import 'dart:convert';

import 'package:bitcoin_ticker/services/network.dart';
import 'package:bitcoin_ticker/utilities/constant.dart';

class Conversion {
  static double _bPrice = 0, _ePrice = 0, _lPrice = 0;
  static String _currency = 'USD';
  String coin;

  NetworkHelper networkHelper = NetworkHelper();

  Future<dynamic> changeCurrency({String newCoin, String currency}) async {
    this.coin = newCoin;
    _currency = currency;
    dynamic data = await networkHelper.getData(
        url: '$coinAverageGlobalPriceApiURL + ${this.coin} + $_currency');

    return data;
  }

  void setBprice(double n) {
    _bPrice = n;
  }

  void setEprice(double n) {
    _ePrice = n;
  }

  void setLprice(double n) {
    _lPrice = n;
  }

  double getBprice() {
    return _bPrice;
  }

  double getEprice() {
    return _ePrice;
  }

  double getLprice() {
    return _lPrice;
  }

  void setCurrency(String newCurrency) {
    _currency = newCurrency;
  }

  void setCoin(String newCoin) {
    coin = newCoin;
  }

  int getprice({String newCoin, String newCurrency}) {
    dynamic data = changeCurrency(newCoin: newCoin, currency: newCurrency);
    dynamic decodedData = jsonDecode(data);
    return decodedData['last'].toInt();
  }

  String selectedCurrency() {
    return _currency;
  }
}
