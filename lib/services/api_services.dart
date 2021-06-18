import 'dart:convert';

import 'package:http/http.dart';
import 'package:rest_api_integration/model/article_model.dart';

class ApiService {
  final endPointUrl =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=98c7a116cbb347199ccc7e240e8012d6';
  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      //this line gets different articles and puts them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the articles");
    }
  }
}
