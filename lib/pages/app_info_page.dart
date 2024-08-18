import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  // Function to launch email app
  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sv30092001@gmail.com', // Replace with your email
      queryParameters: {
        'subject': 'Feedback on Seerne',
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust font sizes based on screen width
    final double titleFontSize = screenWidth * 0.06; // 6% of screen width
    final double bodyFontSize = screenWidth * 0.04; // 4% of screen width
    final double buttonFontSize = screenWidth * 0.045; // 4.5% of screen width
    final double padding = screenWidth * 0.05; // 5% of screen width
    final double spacing = screenHeight * 0.02; // 2% of screen height

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Seerne'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Why Use Seerne?',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: spacing),
              Text(
                """Serene stands out as an exceptional tool for task management due to its well-thought-out features designed to enhance user experience and productivity. The app boasts a Responsive Design that ensures a seamless adaptation to various screen sizes and orientations, providing a consistent and intuitive interface across all devices. Its Clean Interface reflects a minimalist approach, prioritizing user-friendliness and efficiency while eliminating unnecessary clutter. This design choice not only simplifies navigation but also focuses on what truly matters—getting things done. In addition, Serene's Offline Capability sets it apart by allowing users to manage their tasks effectively without needing an internet connection. This ensures that task management remains uninterrupted, regardless of connectivity issues. Furthermore, the Aesthetic Appeal of the app enhances the user experience by combining functionality with visual elegance. Serene's thoughtfully crafted design elements make task management not only practical but also enjoyable. Together, these features create an app that is not just a tool but a companion in achieving personal and professional goals. Whether you are managing daily tasks or long-term projects, Serene’s design and functionality cater to your needs, making productivity a more pleasant endeavor.""",
                style: TextStyle(
                  fontSize: bodyFontSize,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: spacing),
              Text(
                'Help Seerne to Grow',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: spacing),
              Text(
                """We'd love to hear your thoughts on how we can make this app more useful to you. Click the button below to write an email to our product team. Thank you for using our app❤️""",
                style: TextStyle(
                  fontSize: bodyFontSize,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: spacing),
              Center(
                child: TextButton(
                  onPressed: _launchEmail,
                  child: Text(
                    'Click here to send us mail 📩',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: buttonFontSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
