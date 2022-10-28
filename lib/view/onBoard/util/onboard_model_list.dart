import 'package:e_commerce_app/model/onboard_screen_model/onboard_screen_model.dart';

class OnboardList {
  List<OnboardScreenModel> onboardList = [
    OnboardScreenModel(
      bodyText: 'We provide high\nquality products just\njust for you',
      buttonText: 'Next',
      imagePath: 'assets/welcome_and_onboard_screen_assets/onboard1.png',
    ),
    OnboardScreenModel(
      bodyText: 'Your satisfication is\nour number one\npriority',
      buttonText: 'Next',
      imagePath: 'assets/welcome_and_onboard_screen_assets/onboard2.png',
    ),
    OnboardScreenModel(
      bodyText: "Let's fulfill your daily\nneeds with ShoeStore\nright now!",
      buttonText: 'Get Started',
      imagePath: 'assets/welcome_and_onboard_screen_assets/onboard3.png',
    ),
  ];
}
