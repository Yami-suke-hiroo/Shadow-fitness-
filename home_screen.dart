import 'package:flutter/material.dart';
import 'workout_tracker.dart';
import 'daily_quest.dart';
import 'bmi_calculator.dart';
import 'leaderboard.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  HomeScreen({required this.userName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int xp = 0;
  int level = 1;
  int dailyQuestCompleted = 0;
  bool dailyQuestPenaltyApplied = false;

  void gainXP(int amount) {
    setState(() {
      xp += amount;
      if (xp >= level * 100) {
        xp = 0;
        level++;
      }
    });
  }

  void applyDailyPenalty() {
    if (!dailyQuestPenaltyApplied) {
      setState(() {
        xp = (xp - 20) < 0 ? 0 : xp - 20;
        dailyQuestPenaltyApplied = true;
      });
    }
  }

  void resetDailyQuest() {
    setState(() {
      dailyQuestCompleted = 0;
      dailyQuestPenaltyApplied = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shadow Fitness - ${widget.userName}'),
        actions: [
          IconButton(
            icon: Icon(Icons.leaderboard),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LeaderboardScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Level: $level",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("XP: $xp / ${level * 100}",
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WorkoutTracker(onWorkoutComplete: gainXP)),
                  );
                },
                child: Text("Start Workout"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DailyQuestScreen(
                              onQuestComplete: () {
                                gainXP(30);
                                setState(() {
                                  dailyQuestCompleted = 1;
                                });
                              },
                            )),
                  );
                },
                child: Text("Daily Quest"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BMICalculator()),
                  );
                },
                child: Text("BMI Calculator"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
