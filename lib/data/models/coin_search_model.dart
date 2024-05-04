class CoinSearchModel {
  final String name;
  final String iconUrl;
  final double price;
  final double changePercentage;

  CoinSearchModel({
    required this.name,
    required this.iconUrl,
    required this.price,
    required this.changePercentage,
  });

  factory CoinSearchModel.fromJson(Map<String, dynamic> json) {
    // Implemente a deserialização do JSON
    return CoinSearchModel(
      name: json['name'],
      iconUrl: json['icon_url'],
      price: json['price'],
      changePercentage: json['change_percentage'],
    );
  }
}
