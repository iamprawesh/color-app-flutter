// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:color_app/feature/color/domain/model/color_model.dart';

class ColorState {
  final List<ColorModel> colorList;
  final List<String> selctedColorList;
  final bool isLoading;
  ColorState({
    this.colorList = const [],
    this.selctedColorList = const [],
    this.isLoading = false,
  });

  const ColorState.initial({
    this.colorList = const [],
    this.selctedColorList = const [],
    this.isLoading = false,
  });

  ColorState copyWith({
    List<ColorModel>? colorList,
    List<String>? selctedColorList,
    bool? isLoading,
  }) {
    return ColorState(
      colorList: colorList ?? this.colorList,
      selctedColorList: selctedColorList ?? this.selctedColorList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
