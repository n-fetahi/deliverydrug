import 'package:flutter/material.dart';
import 'package:deliverydrug/screen/onBoarding/component/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            OnboardingPage(
              image: Image.asset("assets/images/drugs1.webp"),
              title: "مرحبا",
              description:
                  "بكم في منصة دوائك لدارك",
              noOfScreen: 3,
              onNextPressed: changeScreen,
              currentScreenNo: 0,
            ),
            OnboardingPage(
              image: Image.asset("assets/images/drugs2.webp"),
              title: "أعتني بنفسك",
              description:
                  "يرجى قراءة وصف الدواء بعناية",
              noOfScreen: 3,
              onNextPressed: changeScreen,
              currentScreenNo: 1,
            ),
            //lets add 3rd screen
            OnboardingPage(
              image: Image.asset("assets/images/drugs3.webp"),
              title: "توصيل سريع",
              description:
                  "نقدم لكم التوصيل السريع الخاص بكم",
              noOfScreen: 3,
              onNextPressed: changeScreen,
              currentScreenNo: 2,
            ),
          ],
        ),
      ),
    );
  }

  //Lets write function to change next onboarding screen
  void changeScreen(int nextScreenNo) {
    controller.animateToPage(nextScreenNo,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
