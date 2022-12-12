import 'package:flutter/material.dart';
import 'package:newsapi/Components/custome_buttom_navigationbar.dart';
import 'package:newsapi/Components/navigation_button.dart';
import 'package:newsapi/Components/search_bar.dart';
import 'package:newsapi/Constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const SearchBar(),
            ],
          )
        ),
     
      bottomNavigationBar: const CustomBottomNavigationBar(index: 1),
    );
  }
}