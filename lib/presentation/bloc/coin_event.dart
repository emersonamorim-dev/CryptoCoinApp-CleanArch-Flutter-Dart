part of 'coin_bloc.dart'; // Garante que este arquivo faça parte do mesmo 'part' do seu Bloc

abstract class CoinEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCoin extends CoinEvent {}
