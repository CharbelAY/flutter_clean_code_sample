import 'package:get_it/get_it.dart';
import 'package:numbers_facts/features/number_trivia/presentation/blocs/number_trivia_bloc.dart';
import 'package:numbers_facts/features/number_trivia/presentation/blocs/number_trivia_state.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
    serviceLocator.registerFactory(() => NumberTriviaBloc(Empty()));
}
