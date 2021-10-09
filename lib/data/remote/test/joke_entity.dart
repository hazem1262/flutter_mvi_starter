import 'package:flutter_mvi_starter/generated/json/base/json_convert_content.dart';

class JokeEntity with JsonConvert<JokeEntity> {
	late bool error;
	late String category;
	late String type;
	String? setup;
	String? delivery;
	late JokeFlags flags;
	late bool safe;
	late int id;
	late String lang;
}

class JokeFlags with JsonConvert<JokeFlags> {
	late bool nsfw;
	late bool religious;
	late bool political;
	late bool racist;
	late bool sexist;
	late bool explicit;
}
