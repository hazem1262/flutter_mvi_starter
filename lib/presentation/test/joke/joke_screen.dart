import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/joke_state.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/joke_view_model.dart';
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
    return Container(
      child: Text(state.joke.toString()),
    );
  }
}

/*class JokeScreen extends StatelessWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokeBloc>(
      create: (ctx) => JokeBloc()..add(LoadJoke()),
      child: BlocBuilder<JokeBloc, JokeState>(
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Jokes'),
            ),
            body: Center(
              child: (state is LoadingJoke) ? CustomLoadingJoke():
              (state is LoadedJokeError)? Text(state.error):
              JokeWidget(joke: (state as LoadedJoke).joke),
            ),
            floatingActionButton: (state is LoadingJoke) ? Container():FloatingActionButton(
              onPressed: () {
                BlocProvider.of<JokeBloc>(context).add(LoadJoke());
              },
              tooltip: 'load joke',
              child: const Icon(Icons.add),
            ) , // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }
}*/
