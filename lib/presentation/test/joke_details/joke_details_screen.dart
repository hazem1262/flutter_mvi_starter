import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/data/remote/test/joke_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mvi_starter/generated/locale_keys.g.dart';
import 'package:flutter_mvi_starter/utils/const.dart';

class JokeDetailsScreen extends StatelessWidget {
  const JokeDetailsScreen({Key? key}) : super(key: key);
  static const tag = "JokeDetailsScreen";
  @override
  Widget build(BuildContext context) {
    JokeEntity joke = ModalRoute.of(context)!.settings.arguments as JokeEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.jokeDetails.tr()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(joke.id.toString()),
          Text(joke.setup??''),
          Text(joke.delivery??''),
          Text(joke.category??''),
          Text(joke.lang??''),
          Text('current locale: ${context.locale}'),
          Row(
            children: [
              TextButton(
                onPressed: (){
                  context.setLocale(arabicLocale);
                  print('current locale: ${context.locale}');
                },
                child: Text('Arabic')
              ),
              TextButton(
                onPressed: (){
                  context.setLocale(englishLocale);
                  print('current locale: ${context.locale}');
                },
                child: Text('English')
              )
            ],
          )
        ],
      ),
    );
  }
}
