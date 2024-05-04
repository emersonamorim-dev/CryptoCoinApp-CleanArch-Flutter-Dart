import 'package:equatable/equatable.dart';

abstract class CoinSearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class CoinSearchLoading extends CoinSearchState {}

class CoinSearchLoaded extends CoinSearchState {
  final List<dynamic> coins;

  CoinSearchLoaded({required this.coins});

  @override
  List<Object> get props => [coins];
}

class CoinSearchError extends CoinSearchState {
  final String message;

  CoinSearchError({required this.message});

  @override
  List<Object> get props => [message];
}
