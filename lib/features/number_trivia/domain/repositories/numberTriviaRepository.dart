import 'package:fpdart/fpdart.dart';
import 'package:numbers_facts/core/errors/failures.dart';
import 'package:numbers_facts/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}