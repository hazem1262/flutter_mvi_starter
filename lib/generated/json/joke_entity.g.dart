import 'package:flutter_mvi_starter/generated/json/base/json_convert_content.dart';
import 'package:flutter_mvi_starter/data/remote/test/models/joke_entity.dart';

JokeEntity $JokeEntityFromJson(Map<String, dynamic> json) {
	final JokeEntity jokeEntity = JokeEntity();
	final bool? error = jsonConvert.convert<bool>(json['error']);
	if (error != null) {
		jokeEntity.error = error;
	}
	final String? category = jsonConvert.convert<String>(json['category']);
	if (category != null) {
		jokeEntity.category = category;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		jokeEntity.type = type;
	}
	final String? setup = jsonConvert.convert<String>(json['setup']);
	if (setup != null) {
		jokeEntity.setup = setup;
	}
	final String? delivery = jsonConvert.convert<String>(json['delivery']);
	if (delivery != null) {
		jokeEntity.delivery = delivery;
	}
	final JokeFlags? flags = jsonConvert.convert<JokeFlags>(json['flags']);
	if (flags != null) {
		jokeEntity.flags = flags;
	}
	final bool? safe = jsonConvert.convert<bool>(json['safe']);
	if (safe != null) {
		jokeEntity.safe = safe;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		jokeEntity.id = id;
	}
	final String? lang = jsonConvert.convert<String>(json['lang']);
	if (lang != null) {
		jokeEntity.lang = lang;
	}
	return jokeEntity;
}

Map<String, dynamic> $JokeEntityToJson(JokeEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['error'] = entity.error;
	data['category'] = entity.category;
	data['type'] = entity.type;
	data['setup'] = entity.setup;
	data['delivery'] = entity.delivery;
	data['flags'] = entity.flags.toJson();
	data['safe'] = entity.safe;
	data['id'] = entity.id;
	data['lang'] = entity.lang;
	return data;
}

JokeFlags $JokeFlagsFromJson(Map<String, dynamic> json) {
	final JokeFlags jokeFlags = JokeFlags();
	final bool? nsfw = jsonConvert.convert<bool>(json['nsfw']);
	if (nsfw != null) {
		jokeFlags.nsfw = nsfw;
	}
	final bool? religious = jsonConvert.convert<bool>(json['religious']);
	if (religious != null) {
		jokeFlags.religious = religious;
	}
	final bool? political = jsonConvert.convert<bool>(json['political']);
	if (political != null) {
		jokeFlags.political = political;
	}
	final bool? racist = jsonConvert.convert<bool>(json['racist']);
	if (racist != null) {
		jokeFlags.racist = racist;
	}
	final bool? sexist = jsonConvert.convert<bool>(json['sexist']);
	if (sexist != null) {
		jokeFlags.sexist = sexist;
	}
	final bool? explicit = jsonConvert.convert<bool>(json['explicit']);
	if (explicit != null) {
		jokeFlags.explicit = explicit;
	}
	return jokeFlags;
}

Map<String, dynamic> $JokeFlagsToJson(JokeFlags entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['nsfw'] = entity.nsfw;
	data['religious'] = entity.religious;
	data['political'] = entity.political;
	data['racist'] = entity.racist;
	data['sexist'] = entity.sexist;
	data['explicit'] = entity.explicit;
	return data;
}