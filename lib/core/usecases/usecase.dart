import 'package:fpdart/fpdart.dart';
import 'package:numbers_facts/core/errors/failures.dart';

abstract class UseCase<Type,Params>{
    Future<Either<Failure, Type>> call(Params params);
}
