import 'package:flutter/material.dart';
import 'package:newsapi/Components/custome_buttom_navigationbar.dart';
import 'package:newsapi/Components/news_list_tile.dart';
import 'package:newsapi/Provider/bookmark_provider.dart';
import 'package:newsapi/models/bookmark.dart';
import 'package:provider/provider.dart';
import '../Components/navigation_button.dart';
import '../Constants/constants.dart';
import 'bookmarked_view_screen.dart';

class BookMarksScreen extends StatelessWidget {
  BookMarksScreen({Key? key}) : super(key: key);

  List<Bookmark> _bookmarks = [];

  @override
  Widget build(BuildContext context) {
    _bookmarks = context.watch<BookmarkModel>().bookmarks;
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
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  BookmarkedViewScreen(news: _bookmarks[index],)));
                      },
                      child: Card(
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _bookmarks[index].source.toString(),
                                      style: smallText,
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                     _bookmarks[index].title.toString(),
                                      style: subHeading,
                                      maxLines: 3,
                                      overflow: TextOverflow.fade,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${DateTime.now().difference(DateTime.parse(_bookmarks[index].published.toString())).inMinutes} minutes ago",
                                          style: smallText,
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        GestureDetector(
                                          onTap:(){
                                            context.read<BookmarkModel>().delete(int.parse(_bookmarks[index].id.toString()));
                                          },
                                          child: Icon(Icons.delete)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 135,
                                    width: 135,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${_bookmarks[index].img.toString()}"),
                                      ),
                                    ),
                                    child: const Text(""),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                itemCount: _bookmarks.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}
