import 'package:flutter/material.dart';
import 'package:taskly_fci/profile/profile.dart';

class Task {
  String name;
  DateTime dateTime;
  String priority;
  bool isCompleted;

  Task({
    required this.name,
    required this.dateTime,
    required this.priority,
    this.isCompleted = false,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required String title});
  static const String screenRoute = "HomeScreen";
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Task> tasks = [];
  final TextEditingController _taskNameController = TextEditingController();
  DateTime? _selectedDateTime;
  String _selectedPriority = 'middle';

  void _addTask() {
    if (_taskNameController.text.isEmpty || _selectedDateTime == null) return;
    setState(() {
      tasks.add(Task(
        name: _taskNameController.text,
        dateTime: _selectedDateTime!,
        priority: _selectedPriority,
      ));
    });
    _taskNameController.clear();
    _selectedDateTime = null;
    Navigator.pop(context);
  }

  // دالة اختيار التاريخ والوقت
  Future<void> _pickDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  // دالة حذف المهمة عبر Swipe
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // نافذة إدخال مهمة جديدة
  void _showAddTaskDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskNameController,
                decoration: InputDecoration(labelText: 'name task'),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickDateTime,
                    child: Text('choose date& time'),
                  ),
                  SizedBox(width: 10),
                  if (_selectedDateTime != null)
                    Text(
                      '${_selectedDateTime!.day}/${_selectedDateTime!.month} ${_selectedDateTime!.hour}:${_selectedDateTime!.minute}',
                    ),
                ],
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedPriority,
                onChanged: (value) {
                  setState(() {
                    _selectedPriority = value!;
                  });
                },
                items: ['high', 'middle', 'low']
                    .map((priority) => DropdownMenuItem(
                          value: priority,
                          child: Text(priority),
                        ))
                    .toList(),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addTask,
                child: Text('add tasks'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dailytasks'), actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Icon(
              Icons.supervised_user_circle_sharp,
              size: 36,
            ),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Profile(
                            age: "23",
                            email: "usermail@gmail.com",
                            gender: "Male",
                            password: "123456789",
                            status: "Single",
                          )))
            },
          ),
        )
      ]),
      body: Container(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) => _deleteTask(index),
              child: Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      setState(() {
                        task.isCompleted = value!;
                      });
                    },
                  ),
                  title: Text(
                    task.name,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    'date: ${task.dateTime.day}/${task.dateTime.month}clock: ${task.dateTime.hour}:${task.dateTime.minute} | priority: ${task.priority}',
                  ),
                  trailing: Icon(
                    Icons.circle,
                    color: task.priority == 'high'
                        ? Colors.red
                        : task.priority == 'middle'
                            ? Colors.orange
                            : Colors.green,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
