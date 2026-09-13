import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import '../services/task_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final TaskStorage storage = TaskStorage();
List<Task> tasks = [];

@override
void initState() {
  super.initState();

  tasks = storage.getTasks();

}

final TextEditingController taskController = TextEditingController();

@override
void dispose() {
  taskController.dispose();
  super.dispose();
}

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
          decoration: const BoxDecoration(
            color: Color(0xFF87A878),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Tasks',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Keep track of your day',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Main content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                     decoration: InputDecoration(
  hintText: 'Enter a task',
  hintStyle: const TextStyle(
    color: Colors.grey,
  ),
  prefixIcon: const Icon(
    Icons.add_task,
    color: Color(0xFF87A878),
  ),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: Color(0xFF87A878),
      width: 2,
    ),
  ),
),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () async {
                         if (taskController.text.trim().isNotEmpty) {
                            final task = Task(
                             title: taskController.text,
                            );

                            await storage.addTask(task);

                            setState(() {
                              tasks.add(task);
                            });

                            taskController.clear();
                          }
                        },
                     style: ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF87A878),
  foregroundColor: Colors.white,
  elevation: 2,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Expanded(
  child: tasks.isEmpty
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFE3EBDC),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.checklist_rounded,
                  size: 52,
                  color: Color(0xFF87A878),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'No tasks yet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Add your first task and get started!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
      : ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];

            return TaskTile(
              task: task,
              onChanged: (value) async {
                task.isCompleted = value ?? false;

                await storage.updateTask(index, task);

                setState(() {});
              },
              onDelete: () async {
                await storage.deleteTask(index);

                setState(() {
                  tasks.removeAt(index);
                });
              },
            );
          },
        ),
),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}