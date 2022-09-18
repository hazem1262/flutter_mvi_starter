import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/joke_state.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/joke_view_model.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/widgets/joke_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JokeScreen extends ConsumerStatefulWidget {
  static const tag = "JokeScreen";
  const JokeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends ConsumerState<JokeScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(jokesViewModelProvider.notifier).loadJoke();
  }

  @override
  Widget build(BuildContext context) {
    JokeState state = ref.watch(jokesViewModelProvider);
    return Scaffold(
      body: Center(
        child: state.joke !=null ? JokeWidget(joke: state.joke!,) : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          ref.read(jokesViewModelProvider.notifier).loadJoke();
        },
      ),
    );
  }
}
