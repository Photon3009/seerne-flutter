import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:serene/pages/app_info_page.dart';
import 'package:serene/providers/todo_provider.dart';
import 'package:serene/utils/add_task_dialog.dart';
import 'package:serene/utils/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddTaskDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            'assets/images/app-logo.png',
            width: 40,
            height: 40,
          ),
        ),
        title: const Center(
          child: Text(
            'Seerne',
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.black.withOpacity(0.8),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              size: 28,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AppInfoScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Here's to smashing your goals💪",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.toDoList.length,
                        itemBuilder: (BuildContext context, index) {
                          return TodoList(
                            taskName: provider.toDoList[index][0],
                            taskCompleted: provider.toDoList[index][1],
                            onChanged: (value) =>
                                provider.checkBoxChanged(index),
                            deleteFunction: (context) =>
                                provider.deleteTask(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (provider.showAnimation)
                Positioned.fill(
                  child: IgnorePointer(
                    ignoring: true,
                    child: Center(
                      child: Lottie.asset(
                        'assets/animations/confetti.json',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        repeat: false,
                        onLoaded: (composition) {
                          Future.delayed(composition.duration, () {
                            provider.setShowAnimation(false);
                          });
                        },
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          onPressed: () => _showAddTaskDialog(context),
          backgroundColor: const Color(0xFFFE8D27),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
