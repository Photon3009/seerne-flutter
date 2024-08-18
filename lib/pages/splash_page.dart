import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:serene/pages/home_page.dart';
import 'package:serene/pages/onBoarding_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the next screen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      final box = Hive.box('mybox');
      final isFirstTime = box.get('isFirstTime', defaultValue: true);

      if (isFirstTime) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get the screen dimensions
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          // Define dynamic sizes based on screen dimensions
          final double logoSize = screenWidth * 0.3; // 30% of screen width
          final double titleFontSize = screenWidth * 0.06; // 6% of screen width
          final double subtitleFontSize =
              screenWidth * 0.04; // 4% of screen width
          final double verticalSpacing =
              screenHeight * 0.05; // 5% of screen height

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                // App Logo
                Image.asset(
                  'assets/images/app-logo.png',
                  width: logoSize,
                  height: logoSize,
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                // App Name
                Text(
                  'Seerne',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.3), // 30% of screen height
                // Subtitle
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Your personal ToDo App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: subtitleFontSize,
                      ),
                    ),
                    SizedBox(
                        height: screenHeight * 0.005), // 0.5% of screen height
                    Text(
                      'made with ❤️',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: subtitleFontSize,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: verticalSpacing), // Dynamic spacing at the bottom
              ],
            ),
          );
        },
      ),
    );
  }
}
