import 'package:flutter_mvi_starter/data/remote/test/models/joke_entity.dart';

class JokeState {
  final JokeEntity? joke;
  final String? error;

  JokeState({
    this.joke,
    this.error
  });
}