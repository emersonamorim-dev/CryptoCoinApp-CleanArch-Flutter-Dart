import 'package:cryptoapp/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:cryptoapp/presentation/bloc/coin_search_bloc.dart';
import 'package:cryptoapp/presentation/bloc/coin_search_event.dart';
import 'package:cryptoapp/presentation/bloc/coin_search_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buscar Crypto',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: BlocProvider(
        create: (_) => CoinSearchBloc(httpClient: Dio()), // Use Dio here
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => context
                    .read<CoinSearchBloc>()
                    .add(CoinSearchTextChanged(searchTerm: value)),
                decoration: const InputDecoration(
                  labelText: 'Pesquisando coins',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CoinSearchBloc, CoinSearchState>(
                builder: (context, state) {
                  if (state is CoinSearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CoinSearchLoaded) {
                    return ListView.builder(
                      itemCount: state.coins.length,
                      itemBuilder: (context, index) {
                        final coin = state.coins[index];
                        return ListTile(
                          title: Text(coin['name']),
                          subtitle: Text(
                              '\$${coin['quote']['USD']['price'].toStringAsFixed(2)}'),
                          trailing: Text(
                              '${coin['quote']['USD']['percent_change_24h'].toStringAsFixed(2)}%'),
                        );
                      },
                    );
                  } else if (state is CoinSearchError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
