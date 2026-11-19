import 'package:dio/dio.dart';
import '../model/home_model.dart';

class ApiService {
  final Dio dio = Dio();

  final String baseUrl = 'https://your-keeper.com/keeper/api/home/get_home.php';

  Future<HomeResponse> getHomeData() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        return HomeResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load home data');
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }
}
