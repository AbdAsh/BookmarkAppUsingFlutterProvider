import 'package:bookmark_app_provider/BookmarkBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Bookmark.dart';
import 'BookmarkDetailPage.dart';
import 'package:provider/provider.dart';

  class BookmarkHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final BookmarkBloc bookmarkBloc = Provider.of<BookmarkBloc>(context);
    bookmarkBloc.getBookmarks();

    Widget newsCards = _buildNewsCards(bookmarkBloc.bookmarkList);
    Widget bottomNavigator = _buildBottomNavigator();
    Widget loading = _buildLoadingWidget();

    return Scaffold(
      body: bookmarkBloc.dataLoaded ? loading : newsCards,
      bottomNavigationBar: bottomNavigator,
    );
  }

  Widget _buildLoadingWidget() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildNewsCards(List<Bookmark> bookmarksList) {
    return (ListView.builder(
        itemCount: bookmarksList.length,
        itemBuilder: (BuildContext context, int index) {
          Widget cardContent = _buildCardContent(bookmarksList[index]);
          return SingleChildScrollView(
              child: Card(
                  margin: new EdgeInsets.all(0.1),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookmarkDetailPage(bookmarksList[index]),
                            ));
                      },
                      child: cardContent)
              )
          );
        }));
  }

  _buildCardContent(var bookmark) {
    return Container(
      padding: new EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 275,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  bookmark.title,
                  textScaleFactor: 1.2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Flexible(
                  child: Text(
                    bookmark.description,
                    textScaleFactor: 0.7,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(bookmark.image),
                ),
                borderRadius: BorderRadius.circular(5)),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigator() {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite), title: Text('Favourites')),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), title: Text('Account')),
    ];
    return BottomNavigationBar(items: items);
  }
}
