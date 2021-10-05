import 'package:flutter_mvi_starter/data/remote/test/joke_entity.dart';

jokeEntityFromJson(JokeEntity data, Map<String, dynamic> json) {
	if (json['error'] != null) {
		data.error = json['error'];
	}
	if (json['category'] != null) {
		data.category = json['category'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['setup'] != null) {
		data.setup = json['setup'].toString();
	}
	if (json['delivery'] != null) {
		data.delivery = json['delivery'].toString();
	}
	if (json['flags'] != null) {
		data.flags = JokeFlags().fromJson(json['flags']);
	}
	if (json['safe'] != null) {
		data.safe = json['safe'];
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['lang'] != null) {
		data.lang = json['lang'].toString();
	}
	return data;
}

Map<String, dynamic> jokeEntityToJson(JokeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
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

jokeFlagsFromJson(JokeFlags data, Map<String, dynamic> json) {
	if (json['nsfw'] != null) {
		data.nsfw = json['nsfw'];
	}
	if (json['religious'] != null) {
		data.religious = json['religious'];
	}
	if (json['political'] != null) {
		data.political = json['political'];
	}
	if (json['racist'] != null) {
		data.racist = json['racist'];
	}
	if (json['sexist'] != null) {
		data.sexist = json['sexist'];
	}
	if (json['explicit'] != null) {
		data.explicit = json['explicit'];
	}
	return data;
}

Map<String, dynamic> jokeFlagsToJson(JokeFlags entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['nsfw'] = entity.nsfw;
	data['religious'] = entity.religious;
	data['political'] = entity.political;
	data['racist'] = entity.racist;
	data['sexist'] = entity.sexist;
	data['explicit'] = entity.explicit;
	return data;
}