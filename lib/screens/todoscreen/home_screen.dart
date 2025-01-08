import 'package:dbms_project/provider/todoprovider/todo.dart';
import 'package:dbms_project/screens/todoscreen/create_screen.dart';
import 'package:dbms_project/screens/todoscreen/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dbms_project/models/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
     Provider.of<TodoProvider>(context).fetchTodos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          return FutureBuilder(
            future: todoProvider.fetchTodos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  itemCount: todoProvider.todos.length,
                  itemBuilder: (context, index) {
                    Todo todo = todoProvider.todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.task),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          todoProvider.deleteTodo(todo.taskId);
                        },
                      ),
                      onTap: () {
                        // Navigate to detail or edit screen
                      },
                    );
                  },
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add todo screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
void _navigateToAddTodoScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => CreateTodoScreen(),
    ),
  );
}

void _navigateToEditTodoScreen(BuildContext context, Todo todo) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditTodoScreen(todo: todo),
    ),
  );
}