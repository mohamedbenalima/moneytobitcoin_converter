import 'dart:convert';

import 'package:bitcoinconverter/model/conversion_data.dart';
import 'package:dio/dio.dart';

class AppServices {
  final endPoint = "https://api.coindesk.com/v1/bpi/currentprice.json";
  var dio = Dio();

  Future<ConversionData> getPrices() async {
    var res = await dio.get(endPoint);
    dynamic jsonObject = jsonDecode(res.data);
    print(jsonObject['bpi']['USD']['rate_float'].toString());

    return ConversionData(
        usdPrice: jsonObject['bpi']['USD']['rate_float'],
        euroPrice: jsonObject['bpi']['EUR']['rate_float'],
        gbpPrice: jsonObject['bpi']['GBP']['rate_float'],
        time: jsonObject['time']['updateduk']);
  }
}
