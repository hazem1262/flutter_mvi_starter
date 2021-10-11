import 'package:flutter_mvi_starter/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/utils/style/theme.dart';
import 'package:flutter_mvi_starter/utils/widgets/alerts/base_alert.dart';
import 'package:flutter_mvi_starter/utils/widgets/app_button.dart';

class ConfirmationAlert extends StatelessWidget {
  const ConfirmationAlert({
    Key? key,
    this.title = '',
    this.body = '',
    required this.confirmButtonTitle,
    required this.cancelButtonTitle,
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  final String title;
  final String body;
  final String confirmButtonTitle;
  final String cancelButtonTitle;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return BaseAlert(
      title: title,
      body: body,
      buttonsWidget: Row(
        children: <Widget>[
          Expanded(
            child: AppButton(
              title: confirmButtonTitle,
              color: cornflowerBlue,
              action: () {
                context.navigator.pop(true);
                onConfirm?.call();
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: AppButton(
              title: cancelButtonTitle,
              color: Colors.white,
              borderColor: cornflowerBlue,
              textColor: cornflowerBlue,
              action: () {
                context.navigator.pop(false);
                onCancel?.call();
              },
            ),
          ),
        ],
      ),
    );
  }
}
