import 'package:cryptoapp/presentation/widgets/market_card.dart';
import 'package:flutter/material.dart';

class MarketHeader extends StatelessWidget {
  final double marketCap;
  final double volume;
  final double btcDominance;
  final int fearAndGreedIndex;

  const MarketHeader({
    super.key,
    required this.marketCap,
    required this.volume,
    required this.btcDominance,
    required this.fearAndGreedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MarketCard(title: 'Cap. de Mercado', value: '\$$marketCap T'),
          MarketCard(title: 'Volume', value: '\$$volume B'),
          MarketCard(
              title: 'Dominância',
              value: '${btcDominance.toStringAsFixed(2)}%'),
          MarketCard(
              title: 'Medo e Ganância', value: fearAndGreedIndex.toString()),
        ],
      ),
    );
  }
}
