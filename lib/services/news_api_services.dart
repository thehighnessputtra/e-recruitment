import 'package:dio/dio.dart';
import 'package:latihan_firebase/models/news_api_model.dart';

class NewsApiService {
  final Dio _dio = Dio();
  bool loading = false;
  String baseUrl =
      "https://newsapi.org/v2/everything?q=lowongan%20kerja&from=2022-11-09&sortBy=publishedAt&apiKey=3979c4c66301497a97eb1bb0fbcef7e8";
  Future<List<NewsAPIModel>> getNewsData() async {
    try {
      var response = await _dio.get(baseUrl);
      var data = response.data['articles'] as List;
      return data.map((e) => NewsAPIModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
