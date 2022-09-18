import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/data/remote/test/models/joke_entity.dart';
import 'package:flutter_mvi_starter/presentation/test/joke_details/joke_details_screen.dart';

class JokeWidget extends StatelessWidget {
  const JokeWidget({Key? key, required this.joke}) : super(key: key);
  final JokeEntity joke;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(JokeDetailsScreen.tag, arguments: joke);
      },
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(joke.setup??''),
          Text(joke.delivery??'')
        ],
      ),
    );
  }
}