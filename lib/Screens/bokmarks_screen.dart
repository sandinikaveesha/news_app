import 'package:flutter/material.dart';
import 'package:newsapi/Components/custome_buttom_navigationbar.dart';
import 'package:newsapi/Components/news_list_tile.dart';

import '../Components/navigation_button.dart';
import '../Constants/constants.dart';

class BookMarksScreen extends StatelessWidget {
  const BookMarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmarks"),
        backgroundColor: secondaryColor,
        leading: const NavigationButton(),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: ( (context, index) {
                //return NewsListTitle();
                return Text("");
              }),
              itemCount: 3,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}