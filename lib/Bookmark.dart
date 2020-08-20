class Bookmark {
  String title;
  String description;
  String image;

  Bookmark({this.title, this.description, this.image});



  factory Bookmark.fromJson(Map<String, dynamic> json) {
    var imageNotFound = 'https://blog.rahulbhutani.com/wp-content/uploads/2020/05/Screenshot-2018-12-16-at-21.06.29.png';

    return Bookmark(
      title : json['title'],
      description: json['description'],
      image: json['urlToImage'] != null ? json['urlToImage'] : imageNotFound,
    );
  }
}