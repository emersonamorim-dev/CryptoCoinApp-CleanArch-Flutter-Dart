import 'package:cryptoapp/domain/entities/coin.dart';

// coin_model.dart
class CoinModel {
  final String name;
  final double price;

  CoinModel({required this.name, required this.price});

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      name: json['name'],
      price: double.parse(json['quote']['USD']['price'].toString()),
    );
  }

  Coin toEntity() {
    return Coin(name: name, price: price);
  }
}
