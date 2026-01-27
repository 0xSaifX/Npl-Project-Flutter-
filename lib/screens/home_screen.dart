import 'package:figma/task_manager.dart';
import 'package:figma/widgets.dart';
import 'package:figma/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onProfileTap;
  final Function(int) onNavigate;
  const HomeScreen({
    super.key,
    required this.onProfileTap,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: AppDrawer(onNavigate: onNavigate),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: const Text('Hello, Saif!'),
          actions: [
            GestureDetector(
              onTap: onProfileTap,
              child: const CircleAvatar(
                backgroundImage: AssetImage('images/1st.jpg'),
              ),
            ),
            const SizedBox(width: 16),
          ],
          bottom: TabBar(
            tabs: const [
              Tab(text: 'My tasks'),
              Tab(text: 'Project'),
              Tab(text: 'More'),
            ],
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Colors.grey,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3,
                color: Theme.of(context).colorScheme.primary,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Consumer<TaskManager>(
              builder: (context, taskManager, child) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Have a nice day!",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ProjectCard(
                              title: 'Back End Development',
                              date: 'October 2020',
                              progress: 0.5,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ProjectCard(
                              title: 'UI Design',
                              date: 'November 2020',
                              progress: 0.8,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Progress',
                        style: Theme.of(context).textTheme.titleLarge,
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
            const Center(child: Text('Projects')),
            const Center(child: Text('More')),
          ],
        ),
      ),
    );
  }
}
