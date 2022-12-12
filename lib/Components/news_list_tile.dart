
import 'package:flutter/material.dart';
import '../Constants/constants.dart';

class NewsListTitle extends StatelessWidget {
  const NewsListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
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
                    const Text(
                      "Source",
                      style: smallText,
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet consectetur orem", style: subHeading,
                      
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                          Text(
                      "Published Date",
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
                    decoration: BoxDecoration(image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://ichef.bbci.co.uk/news/1024/branded_news/10B86/production/_127968486_gettyimages-156431895.jpg"),),),
                      child: Text(""),
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
