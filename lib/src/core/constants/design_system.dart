import 'dart:ui';

sealed class DesignSystem {
  static final colors = _Colors();
}

final class _Colors {
  final Color background = const Color(0xFFF4F4F4);
  final Color primary = const Color(0xFF4A657A);
  final Color secondary = const Color(0xFF2F3E46);
  final Color textDetail = const Color(0xFF687680);
  final Color erro = const Color(0xFFD18275);
  final Color success = const Color(0xFF8FB98B);
}
