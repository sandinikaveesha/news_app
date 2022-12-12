import 'package:flutter/material.dart';
import 'package:newsapi/Components/custome_buttom_navigationbar.dart';
import 'package:newsapi/Components/news_list_tile.dart';
import 'package:newsapi/Components/search_bar.dart';
import 'package:newsapi/Controller/news_controller.dart';
import 'package:newsapi/Repository/news_repository.dart';
import 'package:newsapi/Screens/category_display_screen.dart';
import 'package:newsapi/Screens/news_screen.dart';
import 'package:newsapi/models/article.dart';
import 'package:provider/provider.dart';
import '../Components/category_list_tile.dart';
import '../Constants/constants.dart';
import '../Provider/news_provider.dart';
import '../models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   //variables
    List<Article> _news = [];

    //Data Load
    _dataLoad() async{
      var response = await _newsController.fetchAll();
      _news = response;
    }
     //Injections
    final _newsController = NewsController(NewsRepository());

  @override
  void initState() {
   
    super.initState();
    _dataLoad();
  }
  @override
  Widget build(BuildContext context) {
   
    //Greeting message generator
    var timeNow = DateTime.now().hour;
    String greetingMessage() {
      if (timeNow <= 12) {
        return 'Good Morning, ';
      } else if ((timeNow > 12) && (timeNow <= 16)) {
        return 'Good Afternoon, ';
      } else {
        return 'Good Evening, ';
      }
    }
   

    //Category List
    List<Category> categories = [
      Category(slug: "technology", name: "Technology", color: Colors.green,),
      Category(
          slug: "business", name: "Business", color: const Color(0xffF49D1A)),
      Category(
          slug: "general", name: "General", color: const Color(0xffDC3535)),
      Category(slug: "health", name: "Health", color: const Color(0xff3B185F)),
      Category(
          slug: "science", name: "Science", color: const Color(0xff4B56D2)),
      Category(slug: "sports", name: "Sports", color: const Color(0xffCB1C8D), banner: "https://www.rankonesport.com/content/Images/hero-bg.jpg"),
      Category(
          slug: "entertainment",
          name: "Entertainment",
          color: const Color(0xffA555EC)),
    ];


    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        color: screenColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                greetingMessage(),
                textAlign: TextAlign.start,
                style: mainHeading,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: (){
                       context.read<NewsModel>().filterByCategory(categories[index].slug.toString());
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => CategoryDisplayScreen(category: categories[index],)),
                      ),
                    );
                    },
                    child: CategoryListTile(
                      category: categories[index],
                    ),
                  );
                }),
                itemCount: categories.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Explore",
                style: subHeading,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return NewsListTitle(news:_news[index]);
                }),
                itemCount: _news.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
    );
  }
}
