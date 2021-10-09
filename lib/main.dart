import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvi_starter/app_observer.dart';
import 'package:flutter_mvi_starter/bloc/joke_bloc.dart';
import 'package:flutter_mvi_starter/bloc/joke_event.dart';
import 'package:flutter_mvi_starter/bloc/joke_state.dart';
import 'package:flutter_mvi_starter/data/remote/test/joke_entity.dart';
import 'package:flutter_mvi_starter/di/modules/app_module.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule().initialise(Injector()); // initialize simple dependency injector
  Bloc.observer = AppObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokeBloc>(
      create: (ctx) => JokeBloc()..add(LoadJoke()),
      child: BlocBuilder<JokeBloc, JokeState>(
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
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
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ) , // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }
}


class CustomLoadingJoke extends StatelessWidget {
  const CustomLoadingJoke({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Please wait, we will tell you another joke..... ',
        ),
        CircularProgressIndicator(),
      ],
    );
  }
}

class JokeWidget extends StatelessWidget {
  const JokeWidget({Key? key, required this.joke}) : super(key: key);
  final JokeEntity joke;
  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(joke.setup??''),
        Text(joke.delivery??'')
      ],
    );
  }
}

