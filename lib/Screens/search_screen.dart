import 'package:flutter/material.dart';
import 'package:newsapi/Components/custome_buttom_navigationbar.dart';
import 'package:newsapi/Components/navigation_button.dart';
import 'package:newsapi/Components/news_list_tile.dart';
import 'package:newsapi/Components/search_bar.dart';
import 'package:newsapi/Constants/constants.dart';
import 'package:newsapi/Provider/news_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  news  = context.watch<NewsModel>().serach;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: secondaryColor,
        leading: const NavigationButton(),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 30),
          color: screenColor,
          child: Column(
            children: [
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.maxFinite,
                height: 50,
                child: TextField(
                  onChanged: ((value) {
                    context.read<NewsModel>().searchNews(value);
                  }),
                  autofocus: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(onPressed: (){
                      context.read<NewsModel>().sortfunc();
                    }, icon: const Icon(Icons.sort, color: Colors.black,)),
                    hintText: "Search",
                    hintStyle: bodyText,
                  ),
                ),
              ),
            ),
              const SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(itemBuilder: ((context, index) {
                  return NewsListTitle(news: news[index], source: news[index].source,);
                }),
                itemCount: news.length,
                ),
              ),
            ],
          )
        ),
     
      bottomNavigationBar: const CustomBottomNavigationBar(index: 1),
    );
  }
}