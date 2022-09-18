import 'package:flutter_mvi_starter/utils/network/api_response.dart';

abstract class IJokeRepository {
  Future<ApiResponse> getJoke();
}