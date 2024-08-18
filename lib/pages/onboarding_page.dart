import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:serene/pages/home_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust font sizes, icon sizes, and padding based on screen size
    final double iconSize = screenWidth * 0.07; // 7% of screen width
    final double titleFontSize = screenWidth * 0.07; // 7% of screen width
    final double bodyFontSize = screenWidth * 0.12; // 12% of screen width
    final double buttonPaddingHorizontal =
        screenWidth * 0.2; // 20% of screen width
    final double buttonPaddingVertical =
        screenHeight * 0.015; // 1.5% of screen height
    final double letterSpacing = screenWidth * 0.008; // 1% of screen width

    return Scaffold(
      backgroundColor: const Color(0xFFFE8D27),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.07), // 7% of screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1), // 10% of screen height
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: iconSize,
                  color: Colors.white,
                ),
                Icon(
                  Icons.circle,
                  size: iconSize,
                  color: Colors.white.withOpacity(0.35),
                ),
                SizedBox(width: screenWidth * 0.02), // 2% of screen width
                Text(
                  'Seerne',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.10), // 15% of screen height
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: TextStyle(
                  fontSize: bodyFontSize,
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: letterSpacing,
                  height: 1.3,
                ),
                children: [
                  const TextSpan(text: 'Get ready to '),
                  TextSpan(
                    text: 'supercharge',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: letterSpacing * 1.5, // 1.5x spacing
                    ),
                  ),
                  const TextSpan(text: ' your '),
                  TextSpan(
                    text: 'goal',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: letterSpacing * 1.5, // 1.5x spacing
                    ),
                  ),
                  const TextSpan(
                    text: '-setting and planning with our app',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final box = Hive.box('mybox');
                  box.put('isFirstTime', false); // Mark as not first time
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // Set background color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonPaddingHorizontal,
                    vertical: buttonPaddingVertical,
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: titleFontSize * 0.7, // 70% of title font size
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // 5% of screen height
          ],
        ),
      ),
    );
  }
}
