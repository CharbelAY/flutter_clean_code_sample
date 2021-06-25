import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbers_facts/features/number_trivia/presentation/blocs/number_trivia_bloc.dart';
import 'package:numbers_facts/features/number_trivia/presentation/blocs/number_trivia_state.dart';
import 'package:numbers_facts/features/number_trivia/presentation/widgets/widgets.dart';
import '../../../../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Number Trivia'),
        ),
        body: SingleChildScrollView(
          child: buildBody(context),
        ));
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<NumberTriviaBloc>(),
      child: Center(
        child: Column(
          children: [
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
              builder: (context, state) {
                if (state is Empty) {
                  return MessageDisplay(message: "Click the button");
                } else if (state is Loading) {
                  return LoadingWidget();
                } else if (state is Loaded) {
                  return TriviaDisplay(numberTrivia: state.numberTrivia);
                } else if (state is Error)  {
                  return MessageDisplay(message: state.errorMessage);
                }
                else {
                  throw Exception();
                }
              },
            ),
            TriviaControlls(),
          ],
        ),
      ),
    );
  }
}
