import 'dart:convert';

import 'package:flutter/material.dart';

class DashboardItem {
  final Color? color;
  final String title;
  final String imagePath;
  final String earnTo;
  DashboardItem({
    required this.title,
    required this.imagePath,
    required this.earnTo,
    this.color,
  });

  DashboardItem copyWith({
    Color? color,
    required String title,
    required String imagePath,
    required String earnTo,
  }) {
    return DashboardItem(
      color: color, // this.color,
      title: title, // this.title,
      imagePath: imagePath, // this.imagePath,
      earnTo: earnTo, // this.earnTo,
    );
  }

  DashboardItem merge(DashboardItem model) {
    return DashboardItem(
      color: model.color, // this.color,
      title: model.title, // this.title,
      imagePath: model.imagePath, // this.imagePath,
      earnTo: model.earnTo, // this.earnTo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'title': title,
      'imagePath': imagePath,
      'earnTo': earnTo,
    };
  }

  factory DashboardItem.fromMap(Map<String, dynamic> map) {
    return DashboardItem(
      color: map['color'],
      title: map['title'],
      imagePath: map['imagePath'],
      earnTo: map['earnTo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardItem.fromJson(String source) =>
      DashboardItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DashboardItem(color: $color, title: $title, imagePath: $imagePath, earnTo: $earnTo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DashboardItem &&
        other.color == color &&
        other.title == title &&
        other.imagePath == imagePath &&
        other.earnTo == earnTo;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        title.hashCode ^
        imagePath.hashCode ^
        earnTo.hashCode;
  }
}
