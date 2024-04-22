import 'package:flutter/material.dart';

class AppColors {
  static Color get primary => const Color(0xFFBA2512);
  static Color get accent => Colors.blueAccent;
  static MaterialColor get primaryMaterial {
    return createMaterialColor(primary);
  }

  static MaterialColor createMaterialColor(Color color) {
    final List<int> strengths = <int>[
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 0; i < strengths.length; i++) {
      swatch[strengths[i]] = Color.fromRGBO(r, g, b, strengths[i] / 900);
    }

    return MaterialColor(color.value, swatch);
  }
}
