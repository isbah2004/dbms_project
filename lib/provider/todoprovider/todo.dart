
import 'package:dbms_project/models/todo_model.dart';
import 'package:dbms_project/constants/app_exports.dart';

class TodoProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> fetchTodos() async {
    try {
      UserData user = DataStore.userProfile();
      QuerySnapshot snapshot = await _firestore
          .collection('todos')
          .where('userId', isEqualTo: user.id)
          .get();

      _todos = snapshot.docs.map((doc) => Todo.fromMap(doc.data() as Map<String, dynamic>)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addTodo(Todo todo) async {
    try {
      await _firestore.collection('todos').doc(todo.taskId).set(todo.toMap());
      _todos.add(todo);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await _firestore.collection('todos').doc(todo.taskId).update(todo.toMap());
      int index = _todos.indexWhere((t) => t.taskId == todo.taskId);
      if (index != -1) {
        _todos[index] = todo;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTodo(String taskId) async {
    try {
      await _firestore.collection('todos').doc(taskId).delete();
      _todos.removeWhere((t) => t.taskId == taskId);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}