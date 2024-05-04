import 'package:cryptoapp/data/models/coin_search_model.dart';
import 'package:dio/dio.dart';

class CoinSearchRepository {
  final Dio _dio = Dio();
  final String _apiKey = 'a37d0ceb-3cb8-40ac-8c7f-8346057967a5';

  Future<List<CoinSearchModel>> searchCoins(String searchTerm) async {
    final response = await _dio.get(
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/search',
      queryParameters: {
        'start': '1',
        'limit': '10',
        'convert': 'USD',
        'q': searchTerm,
      },
      options: Options(headers: {
        'X-CMC_PRO_API_KEY': _apiKey,
      }),
    );

    if (response.statusCode == 200) {
      final List<dynamic> coinsJson = response.data['data'];
      return coinsJson.map((json) => CoinSearchModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar moedas');
    }
  }
}
