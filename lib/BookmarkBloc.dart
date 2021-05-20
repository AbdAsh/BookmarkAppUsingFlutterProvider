import 'package:bookmark_app_provider/Bookmark.dart';
import 'package:flutter/material.dart';

import 'FetchData.dart';

class BookmarkBloc extends ChangeNotifier {
  List<Bookmark> _bookmarkList = [];
  bool dataLoaded = true;

  List<Bookmark> get bookmarkList => _bookmarkList;

  set bookmarkList(List<Bookmark> value) {
    _bookmarkList = value;
    notifyListeners();
  }

  void getBookmarks() {
    FetchData data = new FetchData();
    data.fetchBookmarks().then((value) {
      dataLoaded = false;
      bookmarkList = value;
    });
  }
}
