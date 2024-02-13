import 'package:flutter/material.dart';

class FeelingCheckup {
  String title;
  String iconPath;
  Color bgColor;

  FeelingCheckup({
    required this.title,
    required this.iconPath,
    required this.bgColor,
  });

  static List<FeelingCheckup> getFeelings() {
    return [
      FeelingCheckup(
          title: 'Happy',
          iconPath: 'assets/icons/happy.svg',
          bgColor: const Color(0xFFEF5DA8)),
      FeelingCheckup(
          title: 'Calm',
          iconPath: 'assets/icons/calm.svg',
          bgColor: const Color(0xFFAEAFF7)),
      FeelingCheckup(
          title: 'Manic',
          iconPath: 'assets/icons/manic.svg',
          bgColor: const Color(0xFFA0E3E2)),
      FeelingCheckup(
          title: 'Angry',
          iconPath: 'assets/icons/angry.svg',
          bgColor: const Color(0xFFF09E54)),
      FeelingCheckup(
          title: 'Sad',
          iconPath: 'assets/icons/sad.svg',
          bgColor: const Color(0xFFC3F2A6))
    ];
  }
}
