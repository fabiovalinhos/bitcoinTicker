import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '';

class CoinData {
  Future getCoinData() async {
    String requestUrl = '$coinAPIURL/BTC/USD?apikey=$apiKey';
    http.Response response = await http.get(requestUrl);
    print('coin_data.dart - Status Code : ${response.statusCode}');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var lastPrice = data['rate'];

      return lastPrice;
    } else {
      print(response.statusCode);

      throw 'Problem with the get request';
    }
  }
}
