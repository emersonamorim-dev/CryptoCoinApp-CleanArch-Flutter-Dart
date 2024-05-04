// Bloc Event
// ignore_for_file: override_on_non_overriding_member
import 'package:equatable/equatable.dart';

abstract class CoinSearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CoinSearchTextChanged extends CoinSearchEvent {
  final String searchTerm;

  CoinSearchTextChanged({required this.searchTerm});

  @override
  List<Object> get props => [searchTerm];
}
