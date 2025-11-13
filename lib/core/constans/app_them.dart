// ملف الثيم لتطبيق Fruit Hub
// تم تحديثه لإصلاح الأخطاء ولإضافة استخدامات للألوان _shadow و _danger

import 'package:flutter/material.dart';

class AppTheme {
  // ألوان رئيسية مستوحاة من مظهر تطبيق الفواكه (Fresh / Vibrant)
  static const Color _primary = Color(0xFF2E7D32); // أخضر طازج
  static const Color _onPrimary = Colors.white;
  static const Color _accent = Color(
    0xFFFFA451,
  ); // أصفر/برتقالي للـ price و call to action
  static Color get accent => _accent;
  static const Color _danger = Color(0xFFD32F2F); // لون الأخطاء أو التحذير
  static const Color _muted = Color(0xFF9E9E9E);
  static const Color _background = Color(0xFFF7F7F7);
  static const Color _surface = Colors.white;
  static const Color _shadow = Color(0x1F000000); // لون الظلال
  static Color get shadow => _shadow;

  // اسم الخط الافتراضي (ضع الخط في pubspec.yaml إن أردت خطوط عربية أجمل)
  static const String _fontFamily = 'Tajawal';

  static ThemeData lightTheme() {
    final base = ThemeData.light();

    final textTheme = _buildTextTheme(base.textTheme);

    return base.copyWith(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: _primary,
      scaffoldBackgroundColor: _background,
      canvasColor: _surface,
      shadowColor: _shadow, // ← استخدام لون الظلال هنا
      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: _surface,
        elevation: 2,
        shadowColor: _shadow,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: _fontFamily,
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        surfaceTintColor: _surface,
      ),

      // Text theme
      textTheme: textTheme,

      // Elevated buttons (Primary CTAs)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _accent,
          foregroundColor: _onPrimary,
          elevation: 3,
          shadowColor: _shadow,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: _fontFamily,
          ),
        ),
      ),

      // Outlined buttons (secondary actions)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primary,
          side: BorderSide(color: _primary.withOpacity(0.16)),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // TextButton (tertiary)
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primary,
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: _fontFamily,
          ),
        ),
      ),

      // Input decorations
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: _muted, fontFamily: _fontFamily),
        errorStyle: TextStyle(
          color: _danger,
          fontFamily: _fontFamily,
        ), // ← استخدام لون الأخطاء هنا
      ),

      // Cards
      cardTheme: CardThemeData(
        color: _surface,
        elevation: 3,
        shadowColor: _shadow,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),

      // Bottom navigation
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _surface,
        elevation: 8,
        selectedItemColor: _primary,
        unselectedItemColor: _muted,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: _fontFamily,
        ),
      ),

      // Floating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _accent,
        foregroundColor: Colors.black87,
        elevation: 6,
        splashColor: _shadow,
        // shadowColor: _shadow,
      ),

      // Chips (used for tags like 'Popular', 'New')
      chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade100,
        selectedColor: _primary.withOpacity(0.12),
        labelStyle: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      // Icon theme
      iconTheme: IconThemeData(color: Colors.black87, size: 22),

      // Snackbars - مخصصة للأخطاء
      snackBarTheme: SnackBarThemeData(
        backgroundColor: _danger.withOpacity(0.95),
        contentTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: _fontFamily,
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Divider
      dividerTheme: DividerThemeData(color: Colors.grey.shade200, thickness: 1),

      // Progress indicator
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: Colors.grey.shade200,
        color: _primary,
      ),

      // Switch theme (بديل عن toggleableActiveColor)
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) return _primary;
          return Colors.grey.shade300;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected))
            return _primary.withOpacity(0.5);
          return Colors.grey.shade300;
        }),
      ),

      // Color scheme مع تضمين لون الأخطاء
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primary,
        primary: _primary,
        secondary: _accent,
        background: _background,
        surface: _surface,
        error: _danger, // ← إضافة لون الأخطاء إلى الـ ColorScheme
        onPrimary: _onPrimary,
      ),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamily,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamily,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamily,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
        fontFamily: _fontFamily,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily,
      ),
    );
  }
}
