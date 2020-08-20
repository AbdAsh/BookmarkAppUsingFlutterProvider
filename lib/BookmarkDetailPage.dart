import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Bookmark.dart';

// ignore: must_be_immutable
class BookmarkDetailPage extends StatelessWidget {
  Bookmark bookmark;

  BookmarkDetailPage(this.bookmark);

  @override
  Widget build(BuildContext context) {
    Widget detailPageBody = _buildBody();
    return Scaffold(
        appBar: AppBar(
          title: Text('Article Details'),
        ),
        body: detailPageBody);
  }

  Widget _buildBody() {
    return Container(
        padding: new EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              bookmark.title,
              textScaleFactor: 2,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10,),
            Flexible(
              child: Image(image: NetworkImage(bookmark.image)),
            ),
            SizedBox(height: 10,),
            Text(
              bookmark.description,
              textScaleFactor: 1.3,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ));
  }
}
