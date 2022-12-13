
import 'package:flutter/material.dart';
import 'package:newsapi/Provider/bookmark_provider.dart';
import 'package:newsapi/Screens/bokmarks_screen.dart';
import 'package:provider/provider.dart';

import '../Components/navigation_button.dart';
import '../Constants/constants.dart';
import '../Utils/database_helper.dart';
import '../models/bookmark.dart';

class BookmarkedViewScreen extends StatelessWidget {
  BookmarkedViewScreen({Key? key, required this.news, })
      : super(key: key);
  final Bookmark news;

  DatabaseHelper _dbHelper = DatabaseHelper.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.source.toString()),
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
                  image: NetworkImage("${news.img.toString()}"),
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
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: (){
                      context.read<BookmarkModel>().delete(int.parse(news.id.toString()));
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> BookMarksScreen()));
                    },
                    child: const Icon(
                      Icons.delete_forever,
                      size: 30,
                      color: secondaryColor,
                    ),
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
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${DateTime.now().difference(DateTime.parse(news.published.toString())).inMinutes} minutes ago",
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
