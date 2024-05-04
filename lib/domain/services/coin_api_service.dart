// ignore_for_file: unused_import

import 'dart:convert';
import 'package:dio/dio.dart';

class CoinApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchCoins() async {
    try {
      const String apiUrl = 'https://api.coinmarketcap.com/v1/ticker/';
      final response = await _dio.get(apiUrl);
      return response.data;
    } catch (error) {
      throw Exception('Failed to load coins');
    }
  }
}
