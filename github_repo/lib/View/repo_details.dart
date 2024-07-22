import 'package:flutter/material.dart';

class RepoDetailsScreen extends StatelessWidget {
  final dynamic repo;

  const RepoDetailsScreen(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repo['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repo['description'] ?? 'No description',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Stars: ${repo['stargazers_count']}',
              style: const TextStyle(fontSize: 16),
            ),


          ],
        ),
      ),
    );
  }
}
