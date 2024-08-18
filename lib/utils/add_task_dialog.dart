import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serene/providers/todo_provider.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context, listen: false);

    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust dimensions based on screen size
    final dialogWidth = screenWidth * 0.8; // 80% of screen width
    final dialogPadding = EdgeInsets.symmetric(
      horizontal:
          screenWidth * 0.05, // 5% of screen width as horizontal padding
      vertical: screenHeight * 0.02, // 2% of screen height as vertical padding
    );
    final fontSize =
        screenWidth * 0.045; // Adjust font size according to screen width
    final buttonFontSize = screenWidth * 0.04; // Adjust button font size

    return AlertDialog(
      title: Text(
        'Add a new task',
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize, // Responsive text size
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      contentPadding: dialogPadding,
      content: SizedBox(
        width: dialogWidth,
        child: TextField(
          controller: provider.controller,
          decoration: InputDecoration(
            hintText: 'Enter task here',
            hintStyle:
                TextStyle(fontSize: fontSize), // Responsive hint text size
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.black), // Active border color
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color(0xFFFE8D27)), // Active border color
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          cursorColor: const Color(0xFFFE8D27), // Cursor color when active
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize, // Responsive text size
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: const Color(0xFFFE8D27),
                  fontSize: buttonFontSize, // Responsive button font size
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                provider.saveNewTask(provider.controller.text);
                provider.clearController();
                Navigator.of(context).pop();
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: const Color(0xFFFE8D27),
                  fontSize: buttonFontSize, // Responsive button font size
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
