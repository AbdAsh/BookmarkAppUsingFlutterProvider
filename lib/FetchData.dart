import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Bookmark.dart';

class FetchData {

  Future<List<Bookmark>> fetchBookmarks() async {
    String apiKey = '4ba6944810e14f2d8518e70d4c815b4b';
    final response = await http.get(
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-07-20&sortBy=publishedAt&apiKey=' +
            apiKey);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['articles'] as List;

      return data.map<Bookmark>((json) => Bookmark.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bookmark');
    }
  }

}
