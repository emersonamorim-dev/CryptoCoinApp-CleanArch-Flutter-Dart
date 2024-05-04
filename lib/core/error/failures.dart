import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  const Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [properties];
}

// Tipos de falhas genéricas
class ServerFailure extends Failure {
  final String message;
  const ServerFailure([this.message = ""]);
}

class CacheFailure extends Failure {
  final String message;
  const CacheFailure([this.message = ""]);
}
