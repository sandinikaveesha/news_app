import 'package:flutter/material.dart';
import 'package:newsapi/Components/custome_buttom_navigationbar.dart';
import 'package:newsapi/Components/news_list_tile.dart';
import 'package:newsapi/Provider/news_provider.dart';
import 'package:newsapi/models/category.dart';
import 'package:provider/provider.dart';

import '../Components/navigation_button.dart';
import '../Constants/constants.dart';

class CategoryDisplayScreen extends StatelessWidget {
  const CategoryDisplayScreen({Key? key, required this.category}) : super(key: key);
  final Category category;
  @override
  Widget build(BuildContext context) {
    final news = context.watch<NewsModel>().newses;
    final status = context.watch<NewsModel>().status;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name.toString()),
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
              image: DecorationImage(image: NetworkImage("${category.banner.toString()}"), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              
              child: status == "Loading" ? Center(child: CircularProgressIndicator(),) :  ListView.builder(itemBuilder: ( (context, index) {
                return NewsListTitle(news:news[index], src: news[index].source,);
              }),
              itemCount: news.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 4),
    );
  }
}