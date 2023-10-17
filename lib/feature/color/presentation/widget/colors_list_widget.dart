import 'package:color_app/feature/color/domain/model/color_model.dart';
import 'package:color_app/feature/color/presentation/providers/color_state_provider.dart';
import 'package:color_app/feature/color/presentation/widget/color_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorListWidget extends ConsumerWidget {
  const ColorListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorStateNotifier);

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisExtent: 150,
        ),
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: state.colorList.length,
        itemBuilder: (context, index) {
          ColorModel item = state.colorList[index];
          return SizedBox(
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black26,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ColorDisplay(
                            item: item,
                            colorIndex: 0,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            " ${item.color1}",
                            style: const TextStyle(
                                color: Colors.green, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        children: [
                          ColorDisplay(
                            item: item,
                            colorIndex: 1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.color2,
                            style: const TextStyle(
                                color: Colors.green, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        children: [
                          ColorDisplay(
                            item: item,
                            colorIndex: 2,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.color3,
                            style: const TextStyle(
                                color: Colors.green, fontSize: 11),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
