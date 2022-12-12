import 'package:flutter/material.dart';
import 'package:newsapi/models/article.dart';
import 'package:newsapi/models/source.dart';

import '../Components/navigation_button.dart';
import '../Constants/constants.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key, required this.news, required this.source})
      : super(key: key);
  final Article news;
  final Source source;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(source.name.toString()),
        backgroundColor: secondaryColor,
        leading: const NavigationButton(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        color: screenColor,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 250,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("${news.urlToImage.toString()}"),
                ),
              ),
              child: Text(""),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "${news.title.toString()}",
                          style: mainHeading,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.bookmark_outline,
                    size: 30,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      news.description.toString(),
                      style: bodyText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      news.content.toString(),
                      style: bodyText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${DateTime.now().difference(DateTime.parse(news.publishAt.toString())).inMinutes} minutes ago",
                          style: smallText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
