import 'package:color_app/feature/color/data/datasourse/color_local_datasource.dart';
import 'package:color_app/feature/color/data/repository/color_repository_impl.dart';
import 'package:color_app/feature/color/domain/repository/color_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorDatasourceProvider = Provider<ColorDataSource>(
  (_) => ColorLocalDatasource(),
);

final colorRepositoryProvider = Provider<ColorRespository>((ref) {
  final datasource = ref.watch(colorDatasourceProvider);
  final respository = ColorRepositoryImpl(datasource);
  return respository;
});
