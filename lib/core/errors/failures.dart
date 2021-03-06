import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List props = const <dynamic>[]]);
    @override
  List<Object> get props => [props];
}

class ServerFailure extends Failure {
}

class CacheFailure extends Failure {}

class InvalidInputFailure extends Failure{}