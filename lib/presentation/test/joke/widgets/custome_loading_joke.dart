import 'package:flutter/material.dart';

class CustomLoadingJoke extends StatelessWidget {
  const CustomLoadingJoke({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Please wait, we will tell you another joke..... ',
        ),
        CircularProgressIndicator(),
      ],
    );
  }
}