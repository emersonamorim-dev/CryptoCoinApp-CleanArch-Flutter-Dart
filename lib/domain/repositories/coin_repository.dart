// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:cryptoapp/domain/entities/coin.dart';
import 'package:cryptoapp/core/error/failures.dart';

abstract class CoinRepository {
  Future<List<Coin>> getCoinData();
}
