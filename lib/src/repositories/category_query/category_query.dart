import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:s_fashion/src/models/category_reponse.dart';

final dio = Dio();
final logger = Logger();

class CategoryQuery {
  static Future<CategoryReponse> getAllCategories() async {
    try {
      final response = await dio.get(
        "http://10.0.2.2:5000/api/categories",
      );

      if (response.statusCode == 200) {
        //logger.i(response.data);
        if (response.data != null) {
          final list = response.data['data']['data'] as List<dynamic>;
          return CategoryReponse.fromJson(list);
        }
      }
    } catch (e) {
      logger.e(e.toString());
      return CategoryReponse.error('Failured in get categories');
    }
    return CategoryReponse.error('Failured in get categories');
  }
}
