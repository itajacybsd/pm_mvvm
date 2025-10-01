import 'package:flutter_test/flutter_test.dart';
import 'package:pm_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';

void main() {
  group("Should test TodoViewModel", () {
    test("Verifying ViewModel initialState", () {
      final TodoViewmodel todoViewmodel = TodoViewmodel();
      expect(todoViewmodel.todos, isEmpty);
    });
    test("Should add Todo", () async {
      final TodoViewmodel todoViewmodel = TodoViewmodel();
      expect(todoViewmodel.todos, isEmpty);

      await todoViewmodel.addTodo.execute("Novo Todo");

      expect(todoViewmodel.todos, isNotEmpty);
      expect(todoViewmodel.todos.first.name, "Novo Todo");
      expect(todoViewmodel.todos.first.id, isNotNull);
    });

    test("Should remove Todo", () async {
      final TodoViewmodel todoViewmodel = TodoViewmodel();
      expect(todoViewmodel.todos, isEmpty);

      await todoViewmodel.addTodo.execute("Novo Todo");

      expect(todoViewmodel.todos, isNotEmpty);
      expect(todoViewmodel.todos.first.name, "Novo Todo");
      expect(todoViewmodel.todos.first.id, isNotNull);

      await todoViewmodel.deleteTodo.execute(todoViewmodel.todos.first);

      expect(todoViewmodel.todos, isEmpty);
    });
  });
}
