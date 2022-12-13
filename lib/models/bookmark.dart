class Bookmark {
  //Table Structure
  static const tblBookmark = 'bookmarks';
  static const colId = 'id';
  static const colTitle = 'title';
  static const colDescription = 'description';
  static const colContent = 'content';
  static const colPublished = 'published';
  static const colSource = 'source';
  static const colImg = 'img';

  Bookmark({this.id, this.title, this.description, this.content, this.published, this.source, this.img});

  int? id;
  String? title;
  String? description;
  String? content;
  String? published;
  String? source;
  String? img;

  Bookmark.fromMap(Map<dynamic, dynamic> map){
    id = map[colId];
    title = map[colTitle];
    description = map[colDescription];
    content = map[colContent];
    published = map[colPublished];
    source = map[colSource];
    img = map[colImg];
  }

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      colTitle: title,
      colDescription: description,
      colContent: content,
      colPublished: published,
      colSource : source,
      colImg : img,

    };
    if(id != null) map[colId] = id;
    return map;
  }
}
