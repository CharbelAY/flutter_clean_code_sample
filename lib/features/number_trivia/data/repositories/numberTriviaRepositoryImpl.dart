import 'package:fpdart/fpdart.dart';
import 'package:numbers_facts/core/errors/exceptions.dart';
import 'package:numbers_facts/features/number_trivia/data/datasources/number_trivia_datasource.dart';
import 'package:numbers_facts/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:numbers_facts/core/errors/failures.dart';
import 'package:numbers_facts/features/number_trivia/domain/repositories/numberTriviaRepository.dart';

class NumberTriviaRepositoryImpl extends NumberTriviaRepository {
  final NumberTriviaDatasource numberTriviaDatasource;
  NumberTriviaRepositoryImpl({required this.numberTriviaDatasource});
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    try {
      var triviaNumber =
          await numberTriviaDatasource.getConcreteNumberTrivia(number: number);
      return Right(triviaNumber);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
