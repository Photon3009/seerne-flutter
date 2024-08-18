import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:serene/data/database.dart';

class TodoProvider extends ChangeNotifier {
  final _myBox = Hive.box('mybox');
  final TextEditingController controller = TextEditingController();
  TodoDataBase db = TodoDataBase();

  // State to track whether the animation should be shown
  bool _showAnimation = false;
  bool _animationPlayed =
      false; // Flag to track if the animation has already been played

  TodoProvider() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  List get toDoList => db.toDoList;

  bool get showAnimation => _showAnimation;

  void checkBoxChanged(int index) {
    db.toDoList[index][1] = !db.toDoList[index][1];
    updateDatabase();
    checkAndUpdateAnimation();
    notifyListeners();
  }

  void saveNewTask(String taskName) {
    db.toDoList.add([taskName, false]);
    updateDatabase();
    notifyListeners();
  }

  void deleteTask(int index) {
    db.toDoList.removeAt(index);
    updateDatabase();
    checkAndUpdateAnimation();
    notifyListeners();
  }

  void updateDatabase() {
    db.updateDatabase();
  }

  void clearController() {
    controller.clear();
  }

  // Method to check if all tasks are completed and update the animation state
  void checkAndUpdateAnimation() {
    final allCompleted = toDoList.every((task) => task[1] == true);

    if (allCompleted && !_animationPlayed) {
      _showAnimation = true;
      _animationPlayed = true; // Mark the animation as played
    } else if (!allCompleted) {
      _animationPlayed = false; // Reset the flag if any task is incomplete
      _showAnimation = false;
    }

    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to manually set the showAnimation state (used after animation completes)
  void setShowAnimation(bool value) {
    _showAnimation = value;
    notifyListeners();
  }
}
