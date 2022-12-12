import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import 'navigation_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Book",style: mainHeading,),
      backgroundColor: secondaryColor,
      leading: const NavigationButton(),
    );
  }
}