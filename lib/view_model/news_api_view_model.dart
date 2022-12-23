// ignore_for_file: avoid_print, annotate_overrides

import 'package:flutter/material.dart';
import 'package:latihan_firebase/models/news_api_model.dart';
import 'package:latihan_firebase/services/news_api_service.dart';

class NewsAPIViewModel extends ChangeNotifier {
  List<ArticlesData> _listArticle = [];
  ArticlesData? _modelArticle;

  List<ArticlesData> get getListArticle => _listArticle;
  ArticlesData? get getModelArticle => _modelArticle;

  getAllDoctor() async {
    // try {
    var response = await NewsApiService().getAll();
    NewApiModel modelApi = NewApiModel.fromJson(response.data);
    _listArticle = (modelApi.articles)!
        .map((e) => ArticlesData(
            // source: e['source'],
            author: e['author'],
            title: e['title'],
            description: e['description'],
            url: e['url'],
            urlToImage: e['urlToImage'],
            // publishedAt: e['publishedAt'],
            content: e['content']))
        .toList();
    print(_listArticle[1].title);
    // } catch (e) {
    //   print(e.toString());
  }

  notifyListeners();
}

  // void selectedDoctor(DataDoctor doctorModel) {
  //   _doctorModel = doctorModel;
  //   notifyListeners();
  // }
// }
