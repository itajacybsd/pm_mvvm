import 'package:flutter/widgets.dart';
import 'package:pm_mvvm/core/commands/commands.dart';
import 'package:pm_mvvm/core/result/result.dart';
import 'package:pm_mvvm/domain/models/todo.dart';

class TodoViewmodel extends ChangeNotifier {
  // quando a classe for instanciada, que a lista de Todo seja carregada
  late Command0 load;

  late Command1<Todo, String> addTodo;

  TodoViewmodel() {
    // load = Command0(_load);
    // load.execute();

    load = Command0(_load)..execute();
    addTodo = Command1(_addTodo);
  }

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<Result> _load() async {
    await Future.delayed(const Duration(seconds: 1));

    final List<Todo> todos = [];

    _todos = todos;

    notifyListeners();
    return Result.ok(todos);
  }

  Future<Result<Todo>> _addTodo(String name) async {
    final lastTodoIndex = _todos.length;

    final createdTodo = Todo(id: lastTodoIndex + 1, name: name);

    _todos.add(createdTodo);

    notifyListeners();
    return Result.ok(createdTodo);
  }
}
