import 'dart:convert';
import 'package:http/http.dart' as http;

import 'default_news_model.dart';

class CatagorisedNews {
  List<Newsdetails> news = [];

  Future<void> getCatagorisedNews(String keyword) async {
    var url =
        "https://newsapi.org/v2/top-headlines?country=$keyword&apiKey=2e48ac443b974b14ac8787dee5492e36";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["content"] != null) {
          Newsdetails newsdetails = Newsdetails(
              title: element["title"],
              url: element["url"],
              imageurl: element["urlToImage"],
              content: element["content"]);
          news.add(newsdetails);
        }
      });
    }
  }
}
