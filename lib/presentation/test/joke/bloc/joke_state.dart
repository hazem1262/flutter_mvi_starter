import 'package:equatable/equatable.dart';
import 'package:flutter_mvi_starter/data/remote/test/models/joke_entity.dart';

abstract class JokeState extends Equatable{
  const JokeState();
  @override
  List<Object?> get props => [];
}

class LoadingJoke extends JokeState{}

class LoadedJoke extends JokeState{
  const LoadedJoke(this.joke);
  final JokeEntity joke;
  @override
  List<Object> get props => [joke];

  @override
  String toString() => 'loaded joke { joke: ${joke.delivery} }';
}

class LoadedJokeError extends JokeState{
  const LoadedJokeError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}