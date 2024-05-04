import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comunidade'),
      ),
      body: const Center(
        // Aqui poderia ter uma interface para fóruns ou grupos de discussão
        child: Text('Espaço para interação da comunidade de criptomoedas.'),
      ),
    );
  }
}
