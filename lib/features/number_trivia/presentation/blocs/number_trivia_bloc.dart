import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbers_facts/features/number_trivia/domain/entities/number_trivia.dart';

import 'number_trivia_event.dart';
import 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  NumberTriviaBloc(NumberTriviaState initialState) : super(initialState);
  
  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) async* {
    if (event is NumberTriviaGetConcreteNumberEvent) {
      yield Loading();
      String test =
          await new Future.delayed(const Duration(seconds: 3), () => "best number");
      NumberTrivia numberTrivia =
          NumberTrivia(number: 7, text: test);
      yield Loaded(numberTrivia: numberTrivia);
    }
  }
}
