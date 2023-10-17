import 'package:color_app/feature/color/domain/model/color_model.dart';
import 'package:color_app/feature/color/presentation/providers/color_state_provider.dart';
import 'package:color_app/helper/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorDisplay extends ConsumerWidget {
  const ColorDisplay({
    super.key,
    required this.colorIndex,
    required this.item,
  });

  final ColorModel item;
  final int colorIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var color = colorIndex == 0
        ? item.color1
        : colorIndex == 1
            ? item.color2
            : item.color3;
    var colorItemUniqueId = '${item.id}-$colorIndex';
    return GestureDetector(
      onTap: () {
        ref.read(colorStateNotifier.notifier).toggleColor(colorItemUniqueId);
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          margin: ref
                  .read(colorStateNotifier.notifier)
                  .isSelected(colorItemUniqueId)
              ? const EdgeInsets.all(2)
              : const EdgeInsets.all(0),
          height: 57,
          decoration: BoxDecoration(
            border: ref
                    .read(colorStateNotifier.notifier)
                    .isSelected(colorItemUniqueId)
                ? Border.all(
                    color: Colors.black54,
                    width: 2,
                  )
                : null,
            borderRadius: BorderRadius.circular(15),
            color: hexToColor(color),
          ),
        ),
      ),
    );
  }
}
