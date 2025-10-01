import 'package:pm_mvvm/core/commands/commands.dart';
import 'package:pm_mvvm/core/result/result.dart';
import 'package:pm_mvvm/domain/models/todo.dart';

class TodoViewmodel {
  // quando a classe for instanciada, que a lista de Todo seja carregada
  late Command0 load;

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<Result> _load() async {
    await Future.delayed(const Duration(seconds: 1));

    final List<Todo>todos = [];

    _todos = todos;
    return Result.ok(todos);
  }
}
