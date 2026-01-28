import 'package:npl_app/task_manager.dart';
import 'package:npl_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  String? _selectedCategory;
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Create New Task',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () => showSnackBar(context, 'Search button pressed'),
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () => showSnackBar(context, 'Filter button pressed'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Color(0xFFF7F8FA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: 'Title',
                hint: 'Colouring Construction',
                controller: _titleController,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Date',
                hint: 'Tuesday, December 9, 2025',
                controller: _dateController,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'Start Time',
                      hint: '4am 10am',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(label: 'End Time', hint: '2pm 8pm'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Description',
                hint:
                    'Lorem ipsum dolor sit amet, consectetur adispicing elit,sed do eiusmod tempor incididunt ut labore et dolore magnaaliqua.',
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              Text(
                'Category',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  _buildCategoryChip('Marketing'),
                  _buildCategoryChip('Meeting'),
                  _buildCategoryChip('Production'),
                  _buildCategoryChip('UI Design'),
                  _buildCategoryChip('Dashboard Design'),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final taskManager = Provider.of<TaskManager>(
                    context,
                    listen: false,
                  );
                  taskManager.addTask(
                    Task(
                      title: _titleController.text,
                      date: _dateController.text,
                      icon: Icons.task,
                    ),
                  );
                  Navigator.of(context).pop();
                  showSnackBar(context, 'Task Created Successfully!');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Create Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    int maxLines = 1,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label) {
    final isSelected = _selectedCategory == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = selected ? label : null;
        });
      },
      showCheckmark: false,
    );
  }
}
