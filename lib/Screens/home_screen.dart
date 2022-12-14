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
    String status = "";
    


  @override
  Widget build(BuildContext context) {
    context.read<NewsModel>().newsAll();
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
      Category(slug: "technology", name: "Technology", color: Colors.green, banner:"https://imageio.forbes.com/specials-images/imageserve/5ef3f7eec4f2390006f0c356/GUI--Graphical-User-Interface--concept-/960x0.jpg?format=jpg&width=960" ),
      Category(
          slug: "business", name: "Business", color: const Color(0xffF49D1A), banner:"https://img.freepik.com/free-photo/group-diverse-people-having-business-meeting_53876-25060.jpg?w=2000" ),
      Category(
          slug: "general", name: "General", color: const Color(0xffDC3535), banner: "https://imageio.forbes.com/specials-images/imageserve/610809bb8938d8e7611910e5/think-outside-the-box-on-school-green-blackboard---startup--education-concept-/960x0.jpg?format=jpg&width=960"),
      Category(slug: "health", name: "Health", color: const Color(0xff3B185F), banner:"https://cdn.medifind.com/wp/2020/08/31184653/00_3_8-Major-Problems-with-the-US-Healthcare-System-Today_hero-768x510.png" ),
      Category(
          slug: "science", name: "Science", color: const Color(0xff4B56D2), banner: "https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg?w=1060&t=st=1671007490~exp=1671008090~hmac=908c6cd2e821e2109e54d2caec17f4768054fc7be8d7da526c71f1f615a28144"),
      Category(slug: "sports", name: "Sports", color: const Color(0xffCB1C8D), banner: "https://www.rankonesport.com/content/Images/hero-bg.jpg"),
      Category(
          slug: "entertainment",
          name: "Entertainment",
          color: const Color(0xffA555EC),banner:"https://www.dfcc.lk/wp-content/uploads/2020/02/Product-Banners-Entertainment.jpg" ),
    ];

    _news = context.watch<NewsModel>().newses;
    status = context.watch<NewsModel>().status;
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
              child: status == "Loading" ?  Center(child: CircularProgressIndicator(),) :  ListView.builder(
                itemBuilder: ((context, index) {
                  return NewsListTitle(news:_news[index], source: _news[index].source,);
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
