import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/data/remote/test/joke_entity.dart';
import 'package:flutter_mvi_starter/di/modules/app_module.dart';
import 'package:flutter_mvi_starter/utils/network/api_response.dart';
import 'package:flutter_mvi_starter/utils/network/network_manager.dart';
import 'package:flutter_mvi_starter/utils/network/network_request.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule().initialise(Injector()); // initialize simple dependency injector
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
  JokeEntity? joke;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: isLoading? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please wait, we will tell you another joke..... ',
            ),
            CircularProgressIndicator(),
          ],
        ): Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(joke?.setup??''),
            Text(joke?.delivery??'')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJoke();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void getJoke() async {
    setState(() {
      isLoading = true;
    });
    final NetworkManager networkManager = Injector().get<NetworkManager>();
    print('network manager: ${networkManager.hashCode}');
    ApiResponse jokeResponse = await networkManager.perform(NetworkRequest('joke/Any', RequestMethod.get));
    if(jokeResponse.status == Status.OK){
      setState(() {
        isLoading = false;
        joke = JokeEntity().fromJson(jokeResponse.data);
      });
    }
  }
}
