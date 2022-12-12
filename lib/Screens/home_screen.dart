import 'package:flutter/material.dart';
import 'package:newsapi/Components/news_list_tile.dart';
import 'package:newsapi/Components/search_bar.dart';
import '../Components/category_list_tile.dart';
import '../Constants/constants.dart';
import '../models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    List<Category> categories =  [
    Category(slug: "technology", name: "Technology", color: Colors.green),
    Category(slug: "business", name: "Business", color: const Color(0xffF49D1A)),
    Category(slug: "general", name: "General", color: const Color(0xffDC3535)),
    Category(slug: "health", name: "Health", color: const Color(0xff3B185F)),
    Category(slug: "science", name: "Science", color: const Color(0xff4B56D2)),
    Category(slug: "sports", name: "Sports", color: const Color(0xffCB1C8D)),
    Category(slug: "entertainment", name: "Entertainment", color: const Color(0xffA555EC)), 
  ];

    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, bottom: 30,),
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
              height: 20,
            ),
            const SearchBar(),
            const SizedBox(height: 20,),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return CategoryListTile(category: categories[index],);
                    }),
                    itemCount: categories.length,
                  ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: Text("Explore", style: subHeading,),
            ),
            const SizedBox(height: 20,),
            NewsListTitle(),
          ],
        ),
      ),
    );
  }
}
