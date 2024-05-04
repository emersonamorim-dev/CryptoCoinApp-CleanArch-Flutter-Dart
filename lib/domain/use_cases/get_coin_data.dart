// ignore_for_file: unused_import

import 'package:cryptoapp/core/error/failures.dart';
import 'package:cryptoapp/domain/entities/coin.dart';
import 'package:cryptoapp/domain/repositories/coin_repository.dart';

class GetCoinData {
  final CoinRepository repository;

  GetCoinData(this.repository);

  Future<List<Coin>> call() async {
    return repository.getCoinData();
  }
}
