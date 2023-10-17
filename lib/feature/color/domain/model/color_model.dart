import 'package:color_app/helper/color_helper.dart';

class ColorModel {
  ColorModel({
    required this.id,
    required this.name,
    required this.color1,
    required this.color2,
    required this.color3,
  });
  late final String id;
  late final String name;
  late final String color1;
  late final String color2;
  late final String color3;

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json['id'],
      name: json['name'],
      color1: isValidHexColor(json['color1'])
          ? json['color1']
          : generateRandomHexCode(),
      color2: isValidHexColor(json['color2'])
          ? json['color2']
          : generateRandomHexCode(),
      color3: isValidHexColor(json['color3'])
          ? json['color3']
          : generateRandomHexCode(),
    );
  }
}
