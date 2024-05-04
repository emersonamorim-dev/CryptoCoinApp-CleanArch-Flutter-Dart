// ignore_for_file: unused_import, duplicate_import
import 'package:cryptoapp/domain/entities/coin.dart';
import 'package:cryptoapp/domain/use_cases/get_coin_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final GetCoinData getCryptosUseCase;

  CoinBloc(this.getCryptosUseCase) : super(CoinLoading()) {
    on<LoadCoin>((event, emit) async {
      emit(CoinLoading());
      try {
        final cryptos = await getCryptosUseCase();
        emit(CoinLoaded(cryptos));
      } catch (e) {
        emit(CoinError(e.toString()));
      }
    });
  }
}
