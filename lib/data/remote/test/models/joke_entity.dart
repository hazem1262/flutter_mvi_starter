import 'package:flutter_mvi_starter/generated/json/base/json_field.dart';
import 'package:flutter_mvi_starter/generated/json/joke_entity.g.dart';


@JsonSerializable()
class JokeEntity {

	JokeEntity();

	factory JokeEntity.fromJson(Map<String, dynamic> json) => $JokeEntityFromJson(json);

	Map<String, dynamic> toJson() => $JokeEntityToJson(this);

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

@JsonSerializable()
class JokeFlags {

	JokeFlags();

	factory JokeFlags.fromJson(Map<String, dynamic> json) => $JokeFlagsFromJson(json);

	Map<String, dynamic> toJson() => $JokeFlagsToJson(this);

	late bool nsfw;
	late bool religious;
	late bool political;
	late bool racist;
	late bool sexist;
	late bool explicit;
}
