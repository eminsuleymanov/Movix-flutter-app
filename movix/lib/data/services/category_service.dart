import 'package:dio/dio.dart';

import '../../utils/constants/endpoints.dart';
import '../../utils/extensions/int_extension.dart';
import '../models/category.dart';

class CategoryService {
  final Dio _dio = Dio();
  Future<List<CategoryResponse>> getCategories() async {
    const endpoint = Endpoints.categories;
    final response = await _dio.get(endpoint);
    // log("$response");
    if (response.statusCode.isSuccess) {
      final List data = response.data['data'];
      // log("$data");
      return data.map((e) => CategoryResponse.fromJson(e)).toList();
    }
    throw Exception('Failed to load categories');
  }
}
