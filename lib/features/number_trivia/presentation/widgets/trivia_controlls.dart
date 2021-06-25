import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbers_facts/features/number_trivia/presentation/blocs/number_trivia_bloc.dart';
import 'package:numbers_facts/features/number_trivia/presentation/blocs/number_trivia_event.dart';

class TriviaControlls extends StatefulWidget {
  const TriviaControlls();

  @override
  _TriviaControllsState createState() => _TriviaControllsState();
}

class _TriviaControllsState extends State<TriviaControlls> {
  final controller = TextEditingController();
  String inputString='7';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  dispatchConcrete();
                }, 
                child: Text("Search"),
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(NumberTriviaGetConcreteNumberEvent(inputString));
  }

}
