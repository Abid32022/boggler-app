import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'create_project.dart';
// import 'your_project_folder/project.dart'; // Make sure to import your Project class

class AnotherScreen extends StatelessWidget {
  final int projectKey; // The key of the saved project

  AnotherScreen({required this.projectKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Details'),
      ),
      body: FutureBuilder(
        future: _getProject(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          final Project project = snapshot.data as Project;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Project Name: ${project.projectName}'),
                Text('Title: ${project.title}'),
                Text('Description: ${project.description}'),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<Project?> _getProject() async {
    try {
      final box = await Hive.openBox<Project>('projects');
      return box.get(projectKey);
    } catch (e) {
      print('Error fetching project: $e');
      return null;
    }
  }
}
