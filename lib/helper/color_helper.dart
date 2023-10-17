import 'dart:math';
import 'dart:ui';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

bool isValidHexColor(String hexColor) {
  final hexColorPattern = RegExp(r'^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');
  return hexColorPattern.hasMatch(hexColor);
}

generateRandomHexCode() {
  final random = Random();
  int randomColor = random.nextInt(0xFFFFFF);
  return '#${(randomColor & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';
}
