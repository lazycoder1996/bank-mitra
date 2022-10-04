import 'package:flutter/material.dart';

TextStyle whiteText(double? fontSize) => TextStyle(
      color: Colors.white,
      fontSize: fontSize!,
    );

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
