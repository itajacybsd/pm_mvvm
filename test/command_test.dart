import 'package:flutter_test/flutter_test.dart';
import 'package:pm_mvvm/core/commands/commands.dart';
import 'package:pm_mvvm/core/result/result.dart';

void main() {
  group("Should test Commands", (){

    //! TESTES PARA COMMAND0
    test("Should teste Command0 returns Ok", () async{
        final command0 = Command0<String>(getOkResult);
        expect(command0.completed, false) ;
        expect(command0.running, false) ;
        expect(command0.error, false) ;
        expect(command0.result, null) ;

        await command0.execute();

        expect(command0.running, false) ;
        expect(command0.error, false) ;
        expect(command0.result, isNotNull) ;
        expect(command0.result!.asOk.value, "The operation has Success.") ;
    });
    test("Should teste Command0 returns Error", () async{
        final command0 = Command0<bool>(getErrorResult);
        expect(command0.completed, false) ;
        expect(command0.running, false) ;
        expect(command0.error, false) ;
        expect(command0.result, null) ;

        await command0.execute();

        expect(command0.error, true) ;
        expect(command0.running, false) ;
        // expect(command0.result, isNotNull) ;
        expect(command0.result!.asError.error,isA<Exception>()) ;
    });

    //! TESTES PARA COMMAND1
    test("Should teste Command1 Ok Result", () async{
        final command1 = Command1<String, String>(getOkResult1);
        expect(command1.running, false) ;
        expect(command1.error, false) ;
        expect(command1.completed, false) ;
        expect(command1.result, isNull) ;

        await command1.execute("Parametro de entrada");

        expect(command1.running, false) ;
        expect(command1.error, false) ;
        expect(command1.completed, true) ;
        expect(command1.result, isA<Ok>()) ;
        expect(command1.result!.asOk.value, "Parametro de entrada") ;
    });

    test("Should teste Command1  Error Result", () async{
        final command1 = Command1< bool,String>(getErrorResult1);
        expect(command1.running, false) ;
        expect(command1.error, false) ;
        expect(command1.completed, false) ;
        expect(command1.result, isNull) ;

        await command1.execute("Parametro de entrada");

        expect(command1.running, false) ;
        expect(command1.error, true) ;
        expect(command1.completed, false) ;
        expect(command1.result, isA<Error>()) ;
        // expect(command1.result!.asOk.value, "Parametro de entrada") ;
    });
   


  });
}

// funcoes para command0 
Future<Result<String>> getOkResult() async {
  await Future.delayed(const Duration(milliseconds: 500));
  return Result.ok("The operation has Success.");

}

Future<Result<bool>> getErrorResult() async {
  await Future.delayed(const Duration(milliseconds: 500));
  return Result.error(Exception("Ocorreu um erro ao gerar estado"));

}

// funcoes para command1 
Future<Result<String>> getOkResult1(String params) async {
  await Future.delayed(const Duration(milliseconds: 500));
  return Result.ok(params);

}

Future<Result<bool>> getErrorResult1(String params) async {
  await Future.delayed(const Duration(milliseconds: 500));
  return Result.error(Exception("Ocorreu um erro ao gerar estado com params: $params"));

}