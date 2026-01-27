import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onNavigate;
  const AppDrawer({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF3F51B5)),
            child: Text(
              'Task App Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              onNavigate(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Tasks'),
            onTap: () {
              onNavigate(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('Create Task'),
            onTap: () {
              onNavigate(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              onNavigate(3);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
