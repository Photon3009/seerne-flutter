import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust padding, font size, and other dimensions based on screen size
    final horizontalPadding = screenWidth * 0.05;
    final verticalPadding = screenHeight * 0.02;
    final fontSize =
        screenWidth * 0.045; // Adjust font size according to screen width
    final checkboxSize = screenWidth * 0.06; // Adjust checkbox size

    return Padding(
      padding: EdgeInsets.only(
        top: verticalPadding,
        left: horizontalPadding,
        right: horizontalPadding,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03), // Adjust icon padding
            ),
          ],
        ),
        child: Container(
          padding:
              EdgeInsets.all(screenWidth * 0.05), // Adjust container padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              SizedBox(
                width: checkboxSize, // Adjust checkbox size
                height: checkboxSize,
                child: Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  checkColor: Colors.black,
                  activeColor: Colors.white60,
                  side: BorderSide(
                      color: Colors.black, width: screenWidth * 0.005),
                ),
              ),
              SizedBox(
                  width: screenWidth *
                      0.03), // Add space between checkbox and text
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.black,
                      decorationThickness: 2,
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
