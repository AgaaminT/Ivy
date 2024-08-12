import 'package:flutter/material.dart';
import 'package:ivy/utils/app_colors.dart';

class CustomThemes {
  static List<Map<String, dynamic>> getThemeList() => [
        {'name': 'light-primary', 'colorHex': 0xFFffffff},
        {'name': 'primary', 'colorHex': 0xFF7167e4},
        {'name': 'dark', 'colorHex': 0xFF262d45},
        {'name': 'info', 'colorHex': 0xFF118def},
        {'name': 'success', 'colorHex': 0xFF2dce9e},
        {'name': 'warning', 'colorHex': 0xFFf54b49},
        {'name': 'danger', 'colorHex': 0xFFf55143},
      ];

  static Map<String, ThemeData> availableThemes = {
    "light-primary": CustomThemes.lightPrimary,
    "primary": CustomThemes.primary,
    "dark": CustomThemes.dark,
    "info": CustomThemes.info,
    "success": CustomThemes.success,
    "warning": CustomThemes.warning,
    "danger": CustomThemes.danger,
  };

  static ThemeData _baseTheme({
    required Color primaryColor,
    required Color radioSelectedColor,
  }) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? radioSelectedColor
              : Colors.grey;
        }),
      ),
      fontFamily: 'Cerebri Sans Pro',
    );
  }

  static ThemeData get lightPrimary => _baseTheme(
        primaryColor: const Color(0xFFf6f9fc),
        radioSelectedColor: const Color(0xFFf6f9fc),
      );

  static ThemeData get primary => _baseTheme(
        primaryColor: const Color(0xFF5e72e4),
        radioSelectedColor: const Color(0xFF5e72e4),
      );

  static ThemeData get dark => _baseTheme(
        primaryColor: const Color(0xFF344767),
        radioSelectedColor: const Color(0xFF344767),
      );

  static ThemeData get info => _baseTheme(
        primaryColor: const Color(0xFF11cdef),
        radioSelectedColor: const Color(0xFF11cdef),
      );

  static ThemeData get success => _baseTheme(
        primaryColor: const Color(0xFF2dce89),
        radioSelectedColor: const Color(0xFF2dce89),
      );

  static ThemeData get warning => _baseTheme(
        primaryColor: const Color(0xFFfb6340),
        radioSelectedColor: const Color(0xFFfb6340),
      );

  static ThemeData get danger => _baseTheme(
        primaryColor: const Color(0xFFf5365c),
        radioSelectedColor: const Color(0xFFf5365c),
      );
}
