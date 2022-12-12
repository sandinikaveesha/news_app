import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../Screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: screenColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 70,
                backgroundColor: screenColor,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image(image: AssetImage("assets/images/zondicons_news-paper.png")),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Morning Buzz",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}