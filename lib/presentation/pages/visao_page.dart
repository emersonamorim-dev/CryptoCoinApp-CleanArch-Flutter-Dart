import 'package:flutter/material.dart';
// import '.../widgets/portfolio_list_widget.dart';

class VisaoPage extends StatelessWidget {
  const VisaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visão Geral'),
      ),
      body: const Center(
        // child: PortfolioListWidget(),
        child: Text('Aqui será exibido o Visão do usuário.'),
      ),
    );
  }
}
