import 'package:flutter/material.dart';

/// Palette for the custom widget set in `lib/widgets/`.
abstract final class CustomColors {
  static const Color brand = Color(0xFF134B59);
  static const Color brandDark = Color(0xFF0C3A45);
  static const Color brandSoft = Color(0xFFDDEBEE);
  static const Color brandTint = Color(0xFFF2F7F8);
  static const Color teal = Color(0xFF14B8A6);
  static const Color tealLight = Color(0xFF5EEAD4);

  static const Color white = Color(0xFFFFFFFF);
  static const Color canvas = Color(0xFFF4F6F8);
  static const Color neutral100 = Color(0xFFF1F3F5);
  static const Color neutral200 = Color(0xFFE4E7EB);
  static const Color neutral400 = Color(0xFFA0A8B1);
  static const Color neutral500 = Color(0xFF7B848F);
  static const Color neutral700 = Color(0xFF4A525C);
  static const Color ink = Color(0xFF0F172A);

  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFE84040);
  static const Color errorSoft = Color(0xFFFDE8E8);
  static const Color info = Color(0xFF3B82F6);

  static const Color reward = Color(0xFFF97316);
  static const Color gold = Color(0xFFFBBF24);
  static const Color lavender = Color(0xFFC9B8ED);
  static const Color lavenderSoft = Color(0xFFEDE7F6);

  /// Progress ring gradient: blue to green.
  static const List<Color> progressRing = <Color>[
    Color(0xFF34D399),
    Color(0xFF22D3EE),
    Color(0xFF60A5FA),
  ];

  /// Primary teal gradient, for floating FABs and CTAs.
  static const List<Color> tealPrimary = <Color>[
    Color(0xFF2DD4BF),
    Color(0xFF134B59),
  ];

  /// Default confetti palette.
  static const List<Color> confetti = <Color>[
    brand,
    reward,
    gold,
    success,
    Color(0xFF81D4FA),
  ];
}
