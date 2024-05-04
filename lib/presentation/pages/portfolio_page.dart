import 'package:cryptoapp/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
// import '.../widgets/portfolio_list_widget.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Portfolio',
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
      body: const Center(
        // Substitua este widget pelo seu próprio widget de listagem de notícias
        // child: NewsListWidget(),
        child: Text('Aqui vão Portfolio sobre criptomoedas.'),
      ),
    );
  }
}
