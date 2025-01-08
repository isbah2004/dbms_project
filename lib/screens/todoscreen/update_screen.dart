import 'package:dbms_project/constants/app_exports.dart';
import 'package:dbms_project/models/todo_model.dart';
import 'package:dbms_project/provider/todoprovider/todo.dart';

class EditTodoScreen extends StatefulWidget {
  final Todo todo;

  const EditTodoScreen({super.key, required this.todo});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _taskController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.todo.title);
    _taskController = TextEditingController(text: widget.todo.task);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _taskController.dispose();
    super.dispose();
  }

  void _updateTodo() {
    if (_formKey.currentState!.validate()) {
      final updatedTodo = Todo(
        taskId: widget.todo.taskId,
        title: _titleController.text,
        task: _taskController.text,
        userId: widget.todo.userId,
        creationDate: widget.todo.creationDate,
      );

      Provider.of<TodoProvider>(context, listen: false).updateTodo(updatedTodo);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _taskController,
                decoration: const InputDecoration(labelText: 'Task'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateTodo,
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}