import 'package:flutter/material.dart';
import 'package:github_repo/View/repo_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RepoListScreen extends StatefulWidget {
  @override
  _RepoListScreenState createState() => _RepoListScreenState();
}

class _RepoListScreenState extends State<RepoListScreen> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _repos = [];
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> fetchRepos(String username) async {
    if (username.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a GitHub username.';
        _repos.clear();
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final response = await http
        .get(Uri.parse('https://api.github.com/users/$username/repos'));

    if (response.statusCode == 200) {
      setState(() {
        _repos = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load repositories. Please try again later.';
      });
    }
  }

  void viewRepoDetails(dynamic repo) {
    // Navigate to a new screen to show repository details
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RepoDetailsScreen(repo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repositories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'GitHub Username',
                border: const OutlineInputBorder(),
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    fetchRepos(_controller.text);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _repos.isEmpty
                    ? const Center(child: Text('No repositories found.'))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _repos.length,
                          itemBuilder: (context, index) {
                            final repo = _repos[index];
                            return GestureDetector(
                              onTap: () => viewRepoDetails(repo),
                              child: Card(
                                elevation: 3,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(16),
                                  title: Text(
                                    repo['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    repo['description'] ?? 'No description',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.yellow),
                                      const SizedBox(width: 4),
                                      Text(
                                        repo['stargazers_count'].toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
