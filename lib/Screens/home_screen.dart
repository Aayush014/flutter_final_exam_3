import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Controller/habit_controller.dart';
import '../Firebase Services/google_auth_services.dart';
import '../Utils/color_palate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HabitController controller = Get.put(HabitController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: primaryColor,
        title: Text(
          "${(GoogleAuthServices.googleAuthServices.currentUser()?.displayName?.split(' ')[0] ?? 'User')}'s Habits",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                GoogleAuthServices.googleAuthServices.currentUser()?.photoURL ??
                    "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg",
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: GetBuilder<HabitController>(
        builder: (controller) => Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 13.0,
              animation: true,
              percent: controller.getCompletionPercentage(),
              // Calculate the percentage
              center: Text(
                "${(controller.getCompletionPercentage() * 100).toStringAsFixed(1)}%", // Show the percentage
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: primaryColor,
              backgroundColor: secondaryColor,
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemCount: controller.habits.length,
                  itemBuilder: (context, index) {
                    final habit = controller.habits[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: habit.isDone ? primaryColor : secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          onLongPress: () {
                            controller.editHabit(context, index);
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                habit.title,
                                style: TextStyle(
                                  color: habit.isDone
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          leading: Checkbox(
                            checkColor:
                                habit.isDone ? Colors.black : Colors.white,
                            activeColor: bgColor,
                            value: habit.isDone,
                            onChanged: (value) {
                              controller.toggleHabitStatus(index);
                            },
                          ),
                          trailing: CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              Icons.delete,
                              color: habit.isDone ? Colors.white : Colors.black,
                            ),
                            onPressed: () {
                              controller.deleteHabit(index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          controller.createNewHabit(context);
        },
      ),
    );
  }
}
