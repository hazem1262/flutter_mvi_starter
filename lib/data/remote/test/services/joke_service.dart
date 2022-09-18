import 'package:flutter_mvi_starter/base/base_service.dart';
import 'package:flutter_mvi_starter/data/remote/test/models/joke_entity.dart';
import 'package:flutter_mvi_starter/utils/network/api_response.dart';
import 'package:flutter_mvi_starter/utils/network/network_request.dart';

class JokeService extends BaseService {
  Future<ApiResponse> getJoke() async {
    final request = NetworkRequest('joke/Any', RequestMethod.get);
    ApiResponse jokeResponse = await networkManager.perform(request);
    if(jokeResponse.status == Status.OK){
      JokeEntity jokeEntity = JokeEntity.fromJson(jokeResponse.data);
      jokeResponse.data = jokeEntity;
    }
    return jokeResponse;
  }
}