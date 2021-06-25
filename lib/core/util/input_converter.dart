
import 'package:fpdart/fpdart.dart';
import 'package:numbers_facts/core/errors/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final number = int.parse(str);
      if (number < 0) throw FormatException();
      return Right(number);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
