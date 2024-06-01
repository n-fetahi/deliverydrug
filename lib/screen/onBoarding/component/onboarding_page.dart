import 'package:deliverydrug/constant/Navigators.dart';
import 'package:deliverydrug/screen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:deliverydrug/screen/onBoarding/component/rounded_button.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.noOfScreen,
      required this.onNextPressed,
      required this.currentScreenNo})
      : super(key: key);

  final Image image;

  final String title;

  final String description;

  final int noOfScreen;

  final Function(int) onNextPressed;

  final int currentScreenNo;

  @override
  Widget build(BuildContext context) {
    bool isLastScreen = currentScreenNo >= noOfScreen - 1;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image,
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 30,fontFamily: 'Cairo', color: Colors.teal.shade700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 20,fontFamily: 'Cairo'),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: !isLastScreen,
              replacement: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 300,
                      height: 50,
                      child: RoundedButton(
                          title: "بـــدء",
                          onPressed: () {
                            openHomeScreen(context);
                          }))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    title: "تخطي",
                    onPressed: () {
                      openHomeScreen(context);
                    },
                  ),
                  Row(
                    children: [
                      for (int index = 0; index < noOfScreen; index++)
                        createProgressDots(
                            (index == currentScreenNo) ? true : false)
                    ],
                  ),
                  RoundedButton(
                    title: "التالي",
                    onPressed: () {
                      onNextPressed(currentScreenNo + 1);
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }

  //Create a function to create progress dots
  Widget createProgressDots(bool isActiveScreen) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActiveScreen ? 15 : 10,
      width: isActiveScreen ? 15 : 10,
      decoration: BoxDecoration(
          color: isActiveScreen ? Colors.teal : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  //Lets create function to open home screen, same function we will call from skip button too.
  void openHomeScreen(BuildContext context) {
   pushNavigator(SplashScreen(), context);
  }
}
