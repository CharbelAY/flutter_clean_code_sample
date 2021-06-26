import 'package:flutter/material.dart';
import 'package:numbers_facts/features/number_trivia/presentation/pages/number_trivia_page.dart';

import 'auth/auth.dart';
import 'injection_container.dart';

class MainPage {
  Widget renderPage() {
    Authentication authService = serviceLocator<Authentication>();
    if (authService.getUserStatus() == Authentication.LOGGED_IN) {
      return NumberTriviaPage();
    } else {
      return Text("You need to login");
    }
  }
}
