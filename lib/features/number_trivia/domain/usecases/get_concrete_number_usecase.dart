import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:numbers_facts/core/errors/failures.dart';
import 'package:numbers_facts/core/usecases/usecase.dart';
import 'package:numbers_facts/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:numbers_facts/features/number_trivia/domain/repositories/numberTriviaRepository.dart';

class GetConcreteNumberUsecase extends UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository numberTriviaRepository;
  GetConcreteNumberUsecase({required this.numberTriviaRepository});
  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) {
    return numberTriviaRepository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({required this.number});

  @override
  List<Object?> get props => [number];
}
