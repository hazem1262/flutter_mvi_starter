import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/utils/style/colors.dart';
import 'package:flutter_mvi_starter/utils/widgets/loading_widget.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    this.action,
    this.height = 50,
    this.enabled = true,
    this.isLoading = false,
    this.color = AppColors.cornflowerBlue,
    this.disabledColor,
    this.borderRadius = 10,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String title;
  final VoidCallback? action;
  final double height;
  final bool enabled;
  final bool isLoading;
  final Color color;
  final Color? disabledColor;
  final double borderRadius;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              primary: enabled
                  ? color
                  : disabledColor ?? AppColors.cornflowerBlue.withOpacity(0.3),
            ),
            onPressed: () {
              if (!isLoading && enabled && action != null) {
                action?.call();
              }
            },
            child: Text(
              isLoading ? '' : title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 15,
              width: 15,
              child: isLoading
                  ? const LoadingWidget(color: Colors.white)
                  : Container(),
            ),
          )
        ],
      ),
    );
  }
}
