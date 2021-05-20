import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Bookmark.dart';
import 'Keys.dart';

class FetchData {

  Future<List<Bookmark>> fetchBookmarks() async {

    final response = await http.get(
        'https://newsapi.org/v2/everything?q=tesla&from=2021-04-20&sortBy=publishedAt&apiKey=' +
            Keys.apiKey);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['articles'] as List;

      return data.map<Bookmark>((json) => Bookmark.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bookmark');
    }
  }

}
