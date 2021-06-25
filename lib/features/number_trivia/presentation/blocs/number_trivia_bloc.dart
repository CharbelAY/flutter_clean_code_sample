import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbers_facts/core/util/input_converter.dart';
import 'package:numbers_facts/features/number_trivia/domain/usecases/get_concrete_number_usecase.dart';

import 'number_trivia_event.dart';
import 'number_trivia_state.dart';


const String INVALID_INPUT_MESSAGE =
    "The number must be a positive integer or zero";


class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberUsecase getConcreteNumberUsecase;
  final InputConverter inputConverter;

  NumberTriviaBloc(
      {
        required NumberTriviaState initialState,
        required this.getConcreteNumberUsecase,
        required this.inputConverter,
      })
      : super(initialState);

  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) async* {
    if (event is NumberTriviaGetConcreteNumberEvent) {
      final inputEither =
          inputConverter.stringToUnsignedInteger(event.numberString);
      yield* inputEither.fold(
        (failure) async* {
          yield Error(errorMessage: INVALID_INPUT_MESSAGE);
        },
        (integer) async* {
          yield Loading();
          final failureOrTrivia =
              await getConcreteNumberUsecase(Params(number: integer));
          yield failureOrTrivia.fold((failure) {
            return Error(errorMessage: 'error');
          }, (trivia) {
            return Loaded(numberTrivia: trivia);
          });
        },
      );
    }
  }
}
