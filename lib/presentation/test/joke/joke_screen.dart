import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/bloc/joke_bloc.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/bloc/joke_event.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/bloc/joke_state.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/widgets/custome_loading_joke.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/widgets/joke_widget.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({Key? key}) : super(key: key);
  static const tag = "JokeScreen";
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
}
