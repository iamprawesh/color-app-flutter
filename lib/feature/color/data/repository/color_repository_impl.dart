import 'package:color_app/feature/color/data/datasourse/color_local_datasource.dart';
import 'package:color_app/feature/color/domain/repository/color_repository.dart';

class ColorRepositoryImpl extends ColorRespository {
  final ColorDataSource colordataSource;
  ColorRepositoryImpl(this.colordataSource);
  @override
  Future<List<dynamic>> fetchColorRepo() {
    return colordataSource.fetchColor();
  }
}
