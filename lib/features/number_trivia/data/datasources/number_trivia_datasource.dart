import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:numbers_facts/core/errors/exceptions.dart';
import 'package:numbers_facts/features/number_trivia/data/models/number_trivia_model.dart';

class NumberTriviaDatasource {
  final http.Client client;
  NumberTriviaDatasource({required this.client});

  Future<NumberTriviaModel> getConcreteNumberTrivia(
      {required int number}) async {
    final response = await client.get(
      Uri.parse('http://numbersapi.com/$number'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
