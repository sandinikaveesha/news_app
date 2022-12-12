
import 'package:flutter/material.dart';
import 'package:newsapi/Constants/constants.dart';

class NewsListTitle extends StatelessWidget {
  const NewsListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Sports",
                        style: smallText,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        "Published Date",
                        style: smallText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur orem ipsum dolor sit amet consectetur",
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                        Text(
                    "Author Name",
                    style: smallText,
                  ),
                   SizedBox(
                        width: 100,
                      ),
                    Icon(Icons.bookmark_outline),
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 135,
                    child: Image(
                      image: NetworkImage(
                          "https://ichef.bbci.co.uk/news/1024/branded_news/10B86/production/_127968486_gettyimages-156431895.jpg"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
