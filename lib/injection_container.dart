import 'package:get_it/get_it.dart';
import 'package:numbers_facts/features/number_trivia/data/datasources/number_trivia_datasource.dart';
import 'package:numbers_facts/features/number_trivia/data/repositories/numberTriviaRepositoryImpl.dart';
import 'package:numbers_facts/features/number_trivia/domain/usecases/get_concrete_number_usecase.dart';
import 'package:numbers_facts/features/number_trivia/presentation/blocs/number_trivia_bloc.dart';
import 'package:numbers_facts/features/number_trivia/presentation/blocs/number_trivia_state.dart';
import 'package:http/http.dart' as http;

import 'core/util/input_converter.dart';
import 'features/number_trivia/domain/repositories/numberTriviaRepository.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {

  serviceLocator.registerFactory(() => NumberTriviaBloc(
      initialState: Empty(), getConcreteNumberUsecase: serviceLocator(), inputConverter: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => GetConcreteNumberUsecase(numberTriviaRepository: serviceLocator()));

  serviceLocator.registerLazySingleton<NumberTriviaRepository>(() =>
      NumberTriviaRepositoryImpl(numberTriviaDatasource: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => NumberTriviaDatasource(client: serviceLocator()));

  serviceLocator.registerLazySingleton(() => http.Client());

  serviceLocator.registerLazySingleton(() => InputConverter());







}
