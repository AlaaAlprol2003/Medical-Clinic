import 'package:flutter/material.dart';

class HeartCategory {
  final String id;
  final String title;
  final IconData icon;
  final List<HeartTip> tips;

  const HeartCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.tips,
  });
}

class HeartTip {
  final String title;
  final String description;

  const HeartTip({
    required this.title,
    required this.description,
  });
}