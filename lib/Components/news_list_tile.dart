
import 'package:flutter/material.dart';
import 'package:newsapi/Screens/news_screen.dart';
import 'package:newsapi/models/article.dart';
import 'package:newsapi/models/source.dart';
import '../Constants/constants.dart';

class NewsListTitle extends StatelessWidget {
  NewsListTitle({Key? key, required this.news}) : super(key: key);
  final Article news;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsScreen(news: news, source: news.source)));
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
                      const Text(
                        "Source",
                        style: smallText,
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        news.title.toString(), style: subHeading, maxLines: 3, overflow: TextOverflow.fade,
                        
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                       "${DateTime.now().difference(DateTime.parse(news.publishAt.toString())).inMinutes} minutes ago",
                        style: smallText,
                      ),
                       SizedBox(
                            width: 100,
                          ),
                        Icon(Icons.bookmark_outline),
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
                        image: NetworkImage("${news.urlToImage.toString()}"),),),
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
}
