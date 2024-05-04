// ignore_for_file: override_on_non_overriding_member
import 'package:cryptoapp/data/models/coin_model.dart';
import 'package:cryptoapp/domain/entities/coin.dart';
import 'package:cryptoapp/domain/repositories/coin_repository.dart';
import 'package:dio/dio.dart';

class CoinRepositoryImpl implements CoinRepository {
  final Dio dio;
  final String apiUrl =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';

  CoinRepositoryImpl(this.dio);

  @override
  Future<List<Coin>> getCoinData() async {
    try {
      final response = await dio.get(
        apiUrl,
        options: Options(headers: {
          'X-CMC_PRO_API_KEY': 'a37d0ceb-3cb8-40ac-8c7f-8346057967a5',
          'Accept': 'application/json',
        }),
      );
      final List<dynamic> data = response.data['data'];
      return data
          .map((crypto) => CoinModel.fromJson(crypto).toEntity())
          .toList();
    } catch (e) {
      throw Exception('Falha ao carregar cryptos');
    }
  }
}
