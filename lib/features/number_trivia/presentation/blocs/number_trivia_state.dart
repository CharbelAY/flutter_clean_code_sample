import 'package:equatable/equatable.dart';
import 'package:numbers_facts/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaState extends Equatable {
  NumberTriviaState([List props = const <dynamic>[]]);
  @override
  List<Object> get props => [props];
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia numberTrivia;

  Loaded({required this.numberTrivia}) : super([numberTrivia]);
}

class Error extends NumberTriviaState {
  final String errorMessage;

  Error({required this.errorMessage}) : super([errorMessage]);
}