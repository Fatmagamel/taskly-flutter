import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskly_fci/home.dart';
class onboarding extends StatelessWidget {
   onboarding({super.key, required String title});
  final List<PageViewModel> pages = [
    PageViewModel(
        title: "hello",
        body: "our application special to you ",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("let's Go"),
        ),
        image: Center(
          child: Image.asset("assets/1.jpg"),
        ),
        decoration: PageDecoration(
            titleTextStyle:
            TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))),
    PageViewModel(
        title: " Track ",
        body: " help you to achieve goals",
        footer: ElevatedButton(
          onPressed: () {},
          child: const Text("let's Go"),
        ),
        image: Center(
          child: Image.asset("assets/2.jpg"),
        ),
        decoration: PageDecoration(
            titleTextStyle:
            TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))),
    PageViewModel(
        title: " check ",
        body: " Manage tasks ",
        footer: ElevatedButton
          (

          onPressed: () {},
          child: const Text("let's Go"),

        ),
        image: Center(
          child: Image.asset("assets/3.png"),
        ),
        decoration: PageDecoration(
            titleTextStyle:
            TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))),
  ];

  static var screenRoute;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Onboarding"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.symmetric(vertical: 24.0),
        child:  IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 10),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            "Done",
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            "Skip",
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),

    );
  }
}
void onDone(context) async{
  final prefs =await SharedPreferences.getInstance();
  await prefs.setBool("ON_BOARDING",false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
}

