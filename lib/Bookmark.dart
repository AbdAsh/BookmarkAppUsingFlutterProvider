class Bookmark {
  String title;
  String description;
  String image;

  Bookmark({this.title, this.description, this.image});



  factory Bookmark.fromJson(Map<String, dynamic> json) {

    return Bookmark(
      title : json['title'],
      description: json['description'],
      image: json['urlToImage'],
    );
  }
}