import 'package:bookmark_app_provider/BookmarkBloc.dart';
import 'package:flutter/material.dart';
import 'package:bookmark_app_provider/BookmarkHomeScreen.dart';
import 'package:provider/provider.dart';
import 'BookmarkHomeScreen.dart';
import 'BookmarkBloc.dart';


void main() {
  runApp(BookmarkApp());
}

class BookmarkApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookmarkBloc>.value(
          value: BookmarkBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BookmarkHomeScreen(),
      ),
    );
  }
}



