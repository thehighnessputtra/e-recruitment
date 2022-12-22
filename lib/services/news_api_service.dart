import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class NewsApiService {
  final _dio = Dio();

  int dateNow = DateTime.now().millisecondsSinceEpoch;
  int dateMonth = 2629800000;
  String apiKey = "3979c4c66301497a97eb1bb0fbcef7e8";
  String baseUrl = 'https://newsapi.org/v2/everything?q=kereta';

  Future getAll() async {
    int result = dateNow - dateMonth;
    DateTime cv = DateTime.fromMillisecondsSinceEpoch(result);
    String dateCv = DateFormat("y-M-d").format(cv);
    // print("$baseUrl&$dateCv&sortBy=publishedAt&apiKey=$apiKey");
    // try {
    //   Response response = await _dio.get(
    //     "$baseUrl&$dateCv&sortBy=publishedAt&apiKey=$apiKey",
    //   );
    //   // print(response);
    //   return response;
    // } on DioError catch (e) {
    //   print(e.response!.statusMessage);
    //   print(e.response!.statusCode);
    //   print("error message = ${e.message}");
    // }
  }
}
