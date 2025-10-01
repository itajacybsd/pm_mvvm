// typedef CommandAction0<T extends Object>

// o T é o tipo de retorno do comando, ou seja, o Output
import 'package:pm_mvvm/core/result/result.dart';

//! Command 0 não possui parâmetros de entrada
typedef CommandAction0<Output extends Object> = Future<Result<Output>> Function();

//! Command 1 possui 1 parâmetro de entrada
typedef CommandAction1<Output extends Object, Input extends Object> = Future<Result<Output>> Function(Input);



abstract class Command<Output extends Object> {
  bool _running = false;
  Result<Output>? _result;

  bool get completed => _result is Ok;

  bool get error => _result is Error;
}