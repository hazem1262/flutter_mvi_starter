import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvi_starter/data/remote/test/models/joke_entity.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/bloc/joke_event.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/bloc/joke_state.dart';
import 'package:flutter_mvi_starter/utils/network/api_response.dart';
import 'package:flutter_mvi_starter/utils/network/network_manager.dart';
import 'package:flutter_mvi_starter/utils/network/network_request.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState>{
  JokeBloc() : super(LoadingJoke());

  Future<ApiResponse> loadJoke() async {
    final NetworkManager networkManager = Injector().get<NetworkManager>();
    print('network manager: ${networkManager.hashCode}');
    ApiResponse jokeResponse = await networkManager.perform(NetworkRequest('joke/Any', RequestMethod.get));
    return jokeResponse;
  }

  @override
  Stream<JokeState> mapEventToState(JokeEvent event) async* {
    yield LoadingJoke();
    if(event is LoadJoke) {
      ApiResponse jokeResponse = await loadJoke();
      if(jokeResponse.status == Status.OK){
        JokeEntity jokeEntity = JokeEntity.fromJson(jokeResponse.data);
        yield LoadedJoke(jokeEntity);
      } else{
        yield LoadedJokeError(jokeResponse.error?.errorMsg??'');
      }
    }
  }

  @override
  void onTransition(Transition<JokeEvent, JokeState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}