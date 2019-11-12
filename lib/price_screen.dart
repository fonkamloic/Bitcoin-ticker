import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/reusableCard.dart';
import 'package:bitcoin_ticker/components/pricePicker.dart';
import 'package:bitcoin_ticker/components/conversion.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  PricePicker pricePicker;
  Conversion conversion = Conversion();
  @override
  void initState() {
    super.initState();
    pricePicker = PricePicker();
  }

  @override
  Widget build(BuildContext context) {
    void rebuild() {
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              ReusableCard(
                coin: 'BTC',
                price: conversion.getBprice(),
                currency: conversion.selectedCurrency(),
              ),
              ReusableCard(
                coin: 'ETH',
                price: conversion.getEprice(),
                currency: conversion.selectedCurrency(),
              ),
              ReusableCard(
                coin: 'LTC',
                price: conversion.getLprice(),
                currency: conversion.selectedCurrency(),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => rebuild(),
            child: Container(
              height: 90.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: pricePicker,
            ),
          ),
        ],
      ),
    );
  }
}
