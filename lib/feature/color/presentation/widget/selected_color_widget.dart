import 'package:color_app/feature/color/presentation/providers/state/color_state.dart';
import 'package:color_app/helper/color_helper.dart';
import 'package:flutter/material.dart';

class SelectedColorWidget extends StatelessWidget {
  const SelectedColorWidget({
    super.key,
    required this.state,
  });

  final ColorState state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 5,
        mainAxisExtent: 50,
      ),
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: state.selctedColorList.length,
      itemBuilder: (context, index) {
        var colorIndex = state.selctedColorList[index].split('-').last;

        var colorItemId =
            state.selctedColorList[index].replaceAll('-$colorIndex', '');
        var findItem =
            state.colorList.indexWhere((element) => element.id == colorItemId);
        if (findItem == -1) return const SizedBox();
        var item = state.colorList[findItem];
        var color = int.parse(colorIndex) == 0
            ? item.color1
            : int.parse(colorIndex) == 1
                ? item.color2
                : item.color3;
        return Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            margin: const EdgeInsets.all(2),
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black54,
                width: 2,
              ),
              color: hexToColor(color),
            ),
          ),
        );
      },
    );
  }
}
