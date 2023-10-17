import 'package:color_app/feature/color/domain/model/color_model.dart';
import 'package:color_app/feature/color/domain/repository/color_repository.dart';
import 'package:color_app/feature/color/presentation/providers/state/color_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorNotifier extends StateNotifier<ColorState> {
  final ColorRespository productSearchRepo;
  ColorNotifier(this.productSearchRepo) : super(const ColorState.initial());

  fetchColors() async {
    state = state.copyWith(isLoading: true);
    var data = await productSearchRepo.fetchColorRepo();
    List<ColorModel> listmy = data.map((i) => ColorModel.fromJson(i)).toList();
    state = state.copyWith(isLoading: false, colorList: listmy);
  }

  toggleColor(usequeId) async {
    var selectedColors = [...state.selctedColorList];
    if (selectedColors.contains(usequeId)) {
      selectedColors.remove(usequeId);
      state = state.copyWith(
        selctedColorList: selectedColors,
      );
    } else {
      selectedColors.add(usequeId);
      state = state.copyWith(
        selctedColorList: selectedColors,
      );
    }
  }

  isSelected(usequeId) {
    return state.selctedColorList.contains(usequeId);
  }
}
