import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:recepi_app_2/constant.dart';
import 'package:recepi_app_2/model/welcome.data.dart';

import '../../home_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;
  int index = 0;

  late List<IntroScreen> introScreens;

  @override
  void initState() {
    introScreens = [
      IntroScreen(
        title: "Discover 1",
        subTitle: "Food Recipe ",
        deskription:
            "dolorem ipsum quia dolor sit\namet, consectetur, adipisci velit\namet, consectetur, adipisci velit...",
        image: "assets/images/screen1.jpg",
      ),
      IntroScreen(
        title: "Discover 2",
        subTitle: "Food Recipe ",
        deskription:
            "dolorem ipsum quia dolor sit\namet, consectetur, adipisci velit\namet, consectetur, adipisci velit...",
        image: "assets/images/screen2.jpg",
      ),
      IntroScreen(
        title: "Discover 3",
        subTitle: "Food Recipe ",
        deskription:
            "dolorem ipsum quia dolor sit\namet, consectetur, adipisci velit\namet, consectetur, adipisci velit...",
        image: "assets/images/screen3.jpg",
      ),
    ];

    introScreens[index].deskription;
    introScreens[index].title;
    introScreens[index].image;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                itemCount: introScreens.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return buildIntroSlide(index, context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildIntroSlide(int index, context) {
    String? deskription = introScreens[index].deskription;
    String? title = introScreens[index].title;
    String? subTitle = introScreens[index].subTitle;
    String? image = introScreens[index].image;
    // sized
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Positioned(
          top: 100,
          left: 20,
          child: buildTitle(title, subTitle, deskription),
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * .35, left: 20),
              child: buildButton(context, "Get Started"),
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: buildDotIndicator(),
        ),
      ],
    );
  }

  // dot indicator
  Widget buildDotIndicator() {
    return DotsIndicator(
      axis: Axis.vertical,
      dotsCount: introScreens.length,
      position: _currentPage,
      decorator: DotsDecorator(
        activeColor: primaryColor,
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  // text title
  Widget buildTitle(String? title, String? subTitle, String? deskription) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          subTitle!,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(height: 15),
        Text(
          deskription!,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white70),
        ),
      ],
    );
  }

  // button
  Widget buildButton(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
              colors: [primaryColor, secondaryColor],
            ),
          ),
          child: TextButton(
            onPressed: () {
              if (_currentPage < introScreens.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              } else {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            },
            child: Row(
              children: [
                buildDot(),
                SizedBox(width: 20),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// white circle dot button
class buildDot extends StatelessWidget {
  const buildDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: const Icon(
        Icons.arrow_downward_rounded,
        size: 30,
        weight: 2,
        color: primaryColor,
      ),
    );
  }
}
