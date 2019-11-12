import 'package:bitcoin_ticker/price_screen.dart';
import 'package:bitcoin_ticker/reusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/components/conversion.dart';
import 'dart:io' show Platform;

class PricePicker extends StatefulWidget {
  PricePicker({this.data});
  final String data;

  @override
  _PricePickerState createState() => _PricePickerState();
}

class _PricePickerState extends State<PricePicker> {
  @override
  void initState() {
    super.initState();
    fetchedCoinData = widget.data;
  }

  Conversion conversion = Conversion();
  dynamic fetchedCoinData;

  Widget iosPicker() {
    return CupertinoPicker(
      itemExtent: 32,
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (selected) {
        setState(() {
          conversion.setCurrency(currenciesList[selected]);
        });
      },
      children: cupPickerFunction(),
    );
  }

  Widget androidPicker() {
    return DropdownButton<String>(
        value: conversion.selectedCurrency(),
        items: myCurrencyLoopFunciton(),
        onChanged: (value) {
          setState(() {
            conversion.setCurrency(value);
          });
        });
  }

  List<DropdownMenuItem<String>> myCurrencyLoopFunciton() {
    List<DropdownMenuItem<String>> item = [];
    for (String val in currenciesList) {
      item.add(
        DropdownMenuItem(
          child: Text(val),
          value: val,
        ),
      );
    }
    return item;
  }

  List<Widget> cupPickerFunction() {
    List<Widget> items = [];
    for (String val in currenciesList) {
      items.add(
        Text(val),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Platform.isIOS ? iosPicker() : androidPicker();
  }
}
