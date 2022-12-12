
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newsapi/Constants/constants.dart';
import 'package:newsapi/Screens/bokmarks_screen.dart';
import 'package:newsapi/Screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../Provider/news_provider.dart';
import '../Screens/search_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GNav(
          selectedIndex: _selectedIndex,
          tabMargin: const EdgeInsets.symmetric(vertical: 5),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: secondaryColor,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Color.fromARGB(255, 116, 137, 211),
          gap: 10,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              iconColor: Colors.white,
              text: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            GButton(
              icon: Icons.search,
              iconColor: Colors.white,
              text: 'Search',
              onPressed: () {
                 context.read<NewsModel>().searchNews("all");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
            ),
             GButton(
              icon: Icons.bookmark_outline,
              iconColor: Colors.white,
              text: 'Bookmark',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookMarksScreen(),
                  ),
                );
              },
            ),
          ]),
    );
  }
}
