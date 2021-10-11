import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/utils/style/theme.dart';
import 'package:flutter_mvi_starter/utils/widgets/alerts/base_alert.dart';
import 'package:flutter_mvi_starter/utils/widgets/app_button.dart';
import 'package:flutter_mvi_starter/utils/extensions/extensions.dart';

class NormalAlert extends StatelessWidget {
  const NormalAlert({
    Key? key,
    this.title = '',
    this.body = '',
    required this.buttonTitle,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String body;
  final String buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseAlert(
      title: title,
      body: body,
      buttonsWidget: AppButton(
        title: buttonTitle,
        color: cornflowerBlue,
        action: () {
          onPressed?.call();
          context.navigator.pop(true);
        },
      ),
    );
  }
}
