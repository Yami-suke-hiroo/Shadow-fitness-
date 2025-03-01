import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> players = [
    {"name": "Alice", "xp": 250, "level": 3},
    {"name": "Bob", "xp": 150, "level": 2},
    {"name": "Charlie", "xp": 50, "level": 1},
  ];

  @override
  Widget build(BuildContext context) {
    players.sort((a, b) {
      if (a['level'] == b['level']) {
        return b['xp'].compareTo(a['xp']);
      }
      return b['level'].compareTo(a['level']);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard"),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return ListTile(
            leading: Text("#${index + 1}"),
            title: Text(player['name']),
            subtitle: Text("Level: ${player['level']}  XP: ${player['xp']}"),
          );
        },
      ),
    );
  }
}
