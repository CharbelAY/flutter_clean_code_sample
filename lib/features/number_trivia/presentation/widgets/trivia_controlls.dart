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
  String inputString='';
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Column(
      children: [

        SizedBox(height: 10),
        Row(
          children: [
          Container(
            width: 200,
            child: TextField(
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(),
            onSubmitted: (_) {
              dispatchConcrete();
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Input a number",
            ),
            onChanged: (value) {
              inputString = value;
            },
                  ),
          ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor
                ),
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
