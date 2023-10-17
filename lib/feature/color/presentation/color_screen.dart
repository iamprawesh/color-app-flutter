import 'package:color_app/feature/color/presentation/providers/color_state_provider.dart';
import 'package:color_app/feature/color/presentation/widget/colors_list_widget.dart';
import 'package:color_app/feature/color/presentation/widget/selected_color_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorScreen extends ConsumerStatefulWidget {
  const ColorScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ColorScreenState();
}

class _ColorScreenState extends ConsumerState<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(colorStateNotifier);

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: state.isLoading
            ? const CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Selected Colors ( ${state.selctedColorList.length} )",
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  state.selctedColorList.isEmpty
                      ? const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          child: Center(
                            child: Text(
                              "Select any color\n to view here",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black38,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : SelectedColorWidget(state: state),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Colors",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const ColorListWidget(),
                ],
              ),
      )),
    );
  }
}
