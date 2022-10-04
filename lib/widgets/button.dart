import 'package:bank_sathi/utils/layout.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final TextStyle? style;
  final Color? primaryColor;
  final double? radius;
  const Button({
    Key? key,
    required this.text,
    this.style,
    this.primaryColor,
    this.radius,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppLayout.getHeight(radius ?? 30)),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
