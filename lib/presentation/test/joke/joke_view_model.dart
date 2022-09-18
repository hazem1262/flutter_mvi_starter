import 'package:flutter_mvi_starter/data/remote/test/i_joke_repository.dart';
import 'package:flutter_mvi_starter/data/remote/test/joke_repository.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/joke_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateNotifierProvider<JokeViewModel, JokeState> jokesViewModelProvider = StateNotifierProvider.autoDispose<JokeViewModel, JokeState>((ref) {
  return JokeViewModel(ref.watch(jokesRepositoryProvider));
});

class JokeViewModel extends StateNotifier<JokeState> {
  JokeViewModel(this.repository) : super(JokeState());
  final IJokeRepository repository;

  loadJoke() {
    repository.getJoke();
  }
}