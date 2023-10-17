import 'package:color_app/feature/color/domain/providers/color_providers.dart';
import 'package:color_app/feature/color/presentation/providers/state/color_notifier.dart';
import 'package:color_app/feature/color/presentation/providers/state/color_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorStateNotifier =
    StateNotifierProvider.autoDispose<ColorNotifier, ColorState>((ref) {
  final repository = ref.watch(colorRepositoryProvider);
  return ColorNotifier(repository)..fetchColors();
});
