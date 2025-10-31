import 'package:flutter/material.dart';
import 'package:raf_mobile/login/initial_page_one.dart';
import 'package:raf_mobile/login/initial_page_two.dart';
import 'package:raf_mobile/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

// const Color kOrange = Color(0xFFD9663A);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Pages',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const OnboardingHost(),
    );
  }
}

class OnboardingHost extends StatefulWidget {
  const OnboardingHost({super.key});

  @override
  State<OnboardingHost> createState() => _OnboardingHostState();
}

class _OnboardingHostState extends State<OnboardingHost> {
  final PageController _pageController = PageController();

  void _goToPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 420), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PageView holds three full-screen pages (left, right, phone)
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: [
          LeftPage(
            pageController: _pageController,
            onNext: () => _goToPage(1),
          ),
          RightPage(
            pageController: _pageController,
            // go to phone page (index 2)
            onComplete: () => _goToPage(2),
          ),
          PhoneNumberPage(
            pageController: _pageController,
            onFinish: () {
              // Replace with actual navigation when onboarding ends
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const Scaffold(
                    body: Center(child: Text('Home / Next screen placeholder')),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
