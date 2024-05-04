import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cryptoapp/presentation/bloc/coin_search_event.dart';
import 'package:cryptoapp/presentation/bloc/coin_search_state.dart';

class CoinSearchBloc extends Bloc<CoinSearchEvent, CoinSearchState> {
  final Dio httpClient;

  CoinSearchBloc({required this.httpClient}) : super(CoinSearchLoading()) {
    on<CoinSearchTextChanged>(_onTextChanged);
  }

  void _onTextChanged(
      CoinSearchTextChanged event, Emitter<CoinSearchState> emit) async {
    if (event.searchTerm.isEmpty) {
      emit(CoinSearchLoading());
      return;
    }

    try {
      final response = await httpClient.get(
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest',
        queryParameters: {'start': 1, 'limit': 10},
        options: Options(
          headers: {
            'Accept': 'application/json',
            'X-CMC_PRO_API_KEY':
                'a37d0ceb-3cb8-40ac-8c7f-8346057967a5' // Use your actual API key
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData =
            response.data; // Dio automatically decodes JSON data
        emit(CoinSearchLoaded(coins: responseData['data']));
      } else {
        emit(CoinSearchError(
            message: 'Error loading coins: ${response.statusMessage}'));
      }
    } catch (e) {
      emit(CoinSearchError(message: e.toString()));
    }
  }
}
