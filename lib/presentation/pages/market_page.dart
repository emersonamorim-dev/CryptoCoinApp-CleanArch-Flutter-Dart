import 'package:cryptoapp/domain/entities/coin.dart';
import 'package:cryptoapp/presentation/bloc/coin_bloc.dart';
import 'package:cryptoapp/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mercado',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            // Voltar para a página HomePage
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is CoinLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CoinLoaded) {
            return ListView.builder(
              itemCount: state.coin.length,
              itemBuilder: (context, index) {
                Coin coin = state.coin[index];
                return ListTile(
                  title: Text(coin.name),
                  trailing: Text('\$${coin.price.toStringAsFixed(2)}'),
                );
              },
            );
          } else if (state is CoinError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
