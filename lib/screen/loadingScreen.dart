import 'dart:convert';
import 'package:bitcoin_ticker/components/conversion.dart';
import 'package:bitcoin_ticker/utilities/constant.dart';
import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/services/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  NetworkHelper networkHelper = NetworkHelper();
  Conversion conversion = Conversion();
  @override
  void initState() {
    super.initState();
    getCoinData();
  }

  void getCoinData() async {
    dynamic Bdata = await networkHelper.getData(
        url: '${coinAverageGlobalPriceApiURL}BTCUSD');
    conversion.setBprice(Bdata);

    dynamic Edata = await networkHelper.getData(
        url: '${coinAverageGlobalPriceApiURL}ETHUSD');
    conversion.setEprice(Edata);

    dynamic Ldata = await networkHelper.getData(
        url: '${coinAverageGlobalPriceApiURL}LTCUSD');
    conversion.setLprice(Ldata);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PriceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitRotatingCircle(
      color: Colors.lightBlue,
      size: 100.0,
    );
  }
}
