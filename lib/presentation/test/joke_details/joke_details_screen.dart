import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/data/remote/test/joke_entity.dart';

class JokeDetailsScreen extends StatelessWidget {
  const JokeDetailsScreen({Key? key}) : super(key: key);
  static const tag = "JokeDetailsScreen";
  @override
  Widget build(BuildContext context) {
    JokeEntity joke = ModalRoute.of(context)!.settings.arguments as JokeEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(joke.id.toString()),
          Text(joke.setup??''),
          Text(joke.delivery??''),
          Text(joke.category??''),
          Text(joke.lang??''),
        ],
      ),
    );
  }
}
