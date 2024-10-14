import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Database Services/database_services.dart';
import '../Model/habit_model.dart';

class HabitController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final TextEditingController editController = TextEditingController();
  var habits = <Habit>[].obs;
  final DatabaseService dbService = DatabaseService();

  @override
  void onInit() {
    super.onInit();
    _loadHabits();
  }

  Future<void> _loadHabits() async {
    habits.value = await dbService.getAllHabits();
    update();
  }

  double getCompletionPercentage() {
    if (habits.isEmpty) return 0.0;
    int completedHabits = habits.where((habit) => habit.isDone).length;
    update();
    return completedHabits / habits.length;
  }

  void addHabit(String title) async {
    Habit newHabit = Habit(title: title);
    await dbService.addHabit(newHabit);
    _loadHabits();
  }

  void toggleHabitStatus(int index) async {
    var habit = habits[index];
    habit.isDone = !habit.isDone;
    await dbService.updateHabit(habit);
    _loadHabits();
  }

  void deleteHabit(int index) async {
    int habitId = habits[index].id!;
    await dbService.deleteHabit(habitId);
    _loadHabits();
  }

  void editHabitTitle(int index, String newTitle) async {
    var habit = habits[index];
    habit.title = newTitle;
    await dbService.updateHabit(habit);
    _loadHabits();
  }

  void createNewHabit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          textCapitalization: TextCapitalization.sentences,
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Create a new habit",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (textController.text.trim().isNotEmpty) {
                addHabit(textController.text);
              }
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void editHabit(BuildContext context, int index) {
    editController.text = habits[index].title;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: editController,
          decoration: const InputDecoration(
            hintText: "Edit Habit",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              String updatedTaskName = editController.text.trim();
              if (updatedTaskName.isNotEmpty) {
                editHabitTitle(index, updatedTaskName);
                Navigator.of(context).pop();
                editController.clear();
              }
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              editController.clear();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
