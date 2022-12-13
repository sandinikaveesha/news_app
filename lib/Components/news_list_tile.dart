
import 'package:flutter/material.dart';
import 'package:newsapi/Screens/news_screen.dart';
import 'package:newsapi/Utils/database_helper.dart';
import 'package:newsapi/models/article.dart';
import 'package:newsapi/models/bookmark.dart';
import 'package:newsapi/models/source.dart';
import '../Constants/constants.dart';

class NewsListTitle extends StatefulWidget {
  NewsListTitle({Key? key, required this.news, required this.source}) : super(key: key);
  final Article news;
  final Source source;

  @override
  State<NewsListTitle> createState() => _NewsListTitleState();
}

class _NewsListTitleState extends State<NewsListTitle> {
  //Inject DB HELPER
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsScreen(news: widget.news, source: widget.news.source)));
        },
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.source.name.toString(),
                        style: smallText,
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.news.title.toString(), style: subHeading, maxLines: 3, overflow: TextOverflow.fade,
                        
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                       "${DateTime.now().difference(DateTime.parse(widget.news.publishAt.toString())).inMinutes} minutes ago",
                        style: smallText,
                      ),
                       const SizedBox(
                            width: 70,
                          ),
                        IconButton(icon: Icon(click == true ? Icons.bookmark : Icons.bookmark_outline,),onPressed: () => _addBookmark(widget.news),),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container( 
                      height: 135,
                      width: 135,
                      decoration: BoxDecoration(image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("${widget.news.urlToImage.toString()}"),),),
                        child: const Text(""),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addBookmark(Article article) async{
    if(click == false){
    Source src = article.source; 
    Bookmark bookmark = Bookmark(title: article.title, description: article.description, content: article.content, published: article.publishAt, img: article.urlToImage, source: src.name);
    await _dbHelper.insertBookmark(bookmark);
    setState(() {
      click = true;
    });
    }
    else{return;}

  }
}
