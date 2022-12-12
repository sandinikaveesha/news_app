import 'package:flutter/material.dart';
import 'package:newsapi/Components/custome_buttom_navigationbar.dart';
import 'package:newsapi/Components/news_list_tile.dart';

import '../Components/navigation_button.dart';
import '../Constants/constants.dart';

class CategoryDisplayScreen extends StatelessWidget {
  const CategoryDisplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports"),
        backgroundColor: secondaryColor,
        leading: const NavigationButton(),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        color: screenColor,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              height: 250,
              decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10)
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(itemBuilder: ( (context, index) {
                return NewsListTitle();
              }),
              itemCount: 4,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 4),
    );
  }
}