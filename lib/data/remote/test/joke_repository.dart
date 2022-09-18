import 'package:flutter_mvi_starter/data/remote/test/i_joke_repository.dart';
import 'package:flutter_mvi_starter/data/remote/test/services/joke_service.dart';
import 'package:flutter_mvi_starter/utils/network/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JokeRepository extends IJokeRepository {
  final JokeService jokeService = JokeService();
  @override
  Future<ApiResponse> getJoke() {
    return jokeService.getJoke();
  }
}

final jokesRepositoryProvider = Provider<IJokeRepository>((ref) => JokeRepository());
