import 'package:flutter/material.dart';
// import '.../widgets/portfolio_list_widget.dart';

class InteressePage extends StatelessWidget {
  const InteressePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Interesse'),
      ),
      body: const Center(
        // child: PortfolioListWidget(),
        child: Text('Aqui será exibido o perfil do usuário.'),
      ),
    );
  }
}
