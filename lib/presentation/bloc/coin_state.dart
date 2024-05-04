part of 'coin_bloc.dart';

abstract class CoinState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinLoading extends CoinState {}

class CoinLoaded extends CoinState {
  final List<Coin> coin;

  CoinLoaded(this.coin);

  @override
  List<Object?> get props => [coin];
}

class CoinError extends CoinState {
  final String message;

  CoinError(this.message);

  @override
  List<Object?> get props => [message];
}
