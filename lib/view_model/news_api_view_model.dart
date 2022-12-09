import 'package:flutter/material.dart';
import 'package:latihan_firebase/models/news_api_model.dart';
import 'package:latihan_firebase/services/news_api_services.dart';

enum ActionState {
  none,
  loading,
  error,
}

class NewsViewModel extends ChangeNotifier {
  List<NewsAPIModel> _news = [];
  List<NewsAPIModel> get news => _news;
  NewsAPIModel? _newsModel;
  final NewsApiService _newsApi = NewsApiService();

  NewsViewModel() {
    getSportNews();
  }

  Future<void> getSportNews() async {
    final newsPaper = await _newsApi.getNewsData();
    _news = newsPaper;
    notifyListeners();
  }
}
