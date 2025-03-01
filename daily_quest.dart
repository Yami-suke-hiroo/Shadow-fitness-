import 'package:flutter/material.dart';

class DailyQuestScreen extends StatelessWidget {
  final VoidCallback onQuestComplete;

  DailyQuestScreen({required this.onQuestComplete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Quest"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Daily Quest: Complete 3 km running or 50 push-ups"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onQuestComplete();
                Navigator.pop(context);
              },
              child: Text("Complete Quest (+30 XP)"),
            ),
            SizedBox(height: 20),
            Text("If not completed, you'll incur a penalty at day end."),
          ],
        ),
      ),
    );
  }
}
