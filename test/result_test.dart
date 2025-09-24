import 'package:flutter_test/flutter_test.dart';
import 'package:pm_mvvm/core/result/result.dart';

void main() {
  group("Should test Ok Result", () {
    test("Should create a Ok Result", () {
      final result = Result.ok("Ok");

      // expect(result, "Ok"); // dá erro pq o result é do tipo Result, não String
      expect((result as Ok).value, "Ok");
    });
    test("Should create a Error Result", () {
      final result = Result.error(Exception("Ocorreu um erro"));

      // expect(result, "Ok"); // dá erro pq o result é do tipo Result, não String
      expect((result as Error).error, isA<Exception>());
    });
  });
}
