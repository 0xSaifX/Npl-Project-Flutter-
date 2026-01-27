import 'package:figma/task_manager.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String date;
  final double progress;

  const ProjectCard({
    super.key,
    required this.title,
    required this.date,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(date, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              // ignore: deprecated_member_use
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${(progress * 100).toInt()}% Progres',
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskListItem extends StatelessWidget {
  final TaskManager taskManager;
  final int taskIndex;

  const TaskListItem({
    super.key,
    required this.taskManager,
    required this.taskIndex,
  });

  @override
  Widget build(BuildContext context) {
    final task = taskManager.tasks[taskIndex];
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(
            context,
            // ignore: deprecated_member_use
          ).colorScheme.primary.withOpacity(0.1),
          child: Icon(task.icon, color: Theme.of(context).colorScheme.primary),
        ),
        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(task.date),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'delete':
                taskManager.deleteTask(taskIndex);
                break;
              case 'move_top':
                taskManager.moveTask(taskIndex, 0);
                break;
              case 'move_bottom':
                taskManager.moveTask(taskIndex, taskManager.tasks.length - 1);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(value: 'delete', child: Text('Delete')),
            const PopupMenuItem<String>(
              value: 'move_top',
              child: Text('Move to Top'),
            ),
            const PopupMenuItem<String>(
              value: 'move_bottom',
              child: Text('Move to Bottom'),
            ),
          ],
        ),
      ),
    );
  }
}
