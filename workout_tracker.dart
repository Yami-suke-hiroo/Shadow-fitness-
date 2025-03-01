import 'package:flutter/material.dart';

class WorkoutTracker extends StatelessWidget {
  final Function(int) onWorkoutComplete;

  WorkoutTracker({required this.onWorkoutComplete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Workout Tracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Complete a workout to earn XP!",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onWorkoutComplete(50);
                Navigator.pop(context);
              },
              child: Text("Complete Workout (Earn 50 XP)"),
            ),
          ],
        ),
      ),
    );
  }
}
