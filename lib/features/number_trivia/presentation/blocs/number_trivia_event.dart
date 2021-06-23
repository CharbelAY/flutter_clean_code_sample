import 'package:equatable/equatable.dart';

abstract class NumberTriviaEvent extends Equatable {
  NumberTriviaEvent([List props = const <dynamic>[]]);
  @override
  List<Object> get props => [props];
}

class NumberTriviaGetConcreteNumberEvent extends NumberTriviaEvent {
  final String numberString;
  NumberTriviaGetConcreteNumberEvent(this.numberString) : super([numberString]);
}

class NumberTriviaGetRandomNumberEvent extends NumberTriviaEvent {}
