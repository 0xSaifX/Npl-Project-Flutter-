import 'package:figma/task_manager.dart';
import 'package:figma/widgets.dart';
import 'package:figma/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  final VoidCallback onAddTask;
  final VoidCallback onGoHome;
  const TasksScreen({
    super.key,
    required this.onAddTask,
    required this.onGoHome,
  });

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int _selectedDay = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: widget.onGoHome,
        ),
        title: const Text('Oct, 2020'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSnackBar(context, 'Search button pressed'),
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () => showSnackBar(context, 'Filter button pressed'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Consumer<TaskManager>(
        builder: (context, taskManager, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      final day = index + 10;
                      final isSelected = day == _selectedDay;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDay = day;
                          });
                        },
                        child: Container(
                          width: 60,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '$day',
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Task', style: Theme.of(context).textTheme.titleLarge),
                    ElevatedButton.icon(
                      onPressed: widget.onAddTask,
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Add task'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: taskManager.tasks.length,
                  itemBuilder: (context, index) {
                    return TaskListItem(
                      taskManager: taskManager,
                      taskIndex: index,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
