import 'package:flutter/material.dart';

import '../Components/navigation_button.dart';
import '../Constants/constants.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected News"),
        backgroundColor: secondaryColor,
        leading: const NavigationButton(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        color: screenColor,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 250,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://ichef.bbci.co.uk/news/1024/branded_news/10B86/production/_127968486_gettyimages-156431895.jpg"),
                ),
              ),
              child: Text(""),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur",
                          style: mainHeading,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.bookmark_outline,
                    size: 30,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Mauris mauris rhoncus dolor id tellus. In dui pretium eninunc purus viverra enim auctor neque. Egestas morbi diam varius quis nec aliquam nisi maecenas. Eget sagittis vel congue semper maecenas dui.Lorem ipsum dolor sit amet consectetur. Mauris mauris rhoncus dolor id tellus. In dui pretium eninunc purus viverra enim auctor neque. Egestas morbi diam varius quis nec aliquam nisi maecenas. Eget sagittis vel congue semper maecenas dui.",
                  style: bodyText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
