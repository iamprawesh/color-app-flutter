import 'dart:convert';

import 'package:flutter/services.dart';

abstract class ColorDataSource {
  Future<List<dynamic>> fetchColor();
}

class ColorLocalDatasource extends ColorDataSource {
  @override
  Future<List<dynamic>> fetchColor() async {
    try {
      final String response = await rootBundle.loadString('assets/colors.json');
      final data = json.decode(response) as List;
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
