import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:news_app_19710023/model/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final Client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'id',
      'category': 'technology',
      'apiKey': '97525ab16e1e41b4b0b12470f7012671'
    };

    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await Client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
