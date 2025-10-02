// typedef CommandAction0<T extends Object>

// o T é o tipo de retorno do comando, ou seja, o Output
import 'package:flutter/widgets.dart';
import 'package:pm_mvvm/core/result/result.dart';

//! Command 0 não possui parâmetros de entrada
typedef CommandAction0<Output extends Object> =
    Future<Result<Output>> Function();

//! Command 1 possui 1 parâmetro de entrada
typedef CommandAction1<Output extends Object, Input extends Object> =
    Future<Result<Output>> Function(Input);

abstract class Command<Output extends Object> extends ChangeNotifier{
  // verifica se o comando está em execução
  bool _running = false;
  bool get running => _running;

  // representação do nosso estado => Ok ou Error, ou Null
  Result<Output>? _result;
  Result<Output>? get result => _result;

  // verifica se o nosso estado foi gerado com sucesso
  bool get completed => _result is Ok;

  // verifica se o nosso estado  é de erro
  bool get error => _result is Error;

  // método para executar o comando
  // automatizar a notificação de estado
  Future<void> _execute(CommandAction0<Output> action) async {
    // Impede que a action seja reexecutada mais uma vez simultaneamente
    if (_running) return; // se já estiver em execução, não faz nada

    // Agora nossa action está em execução
    _running = true; // marca como em execução
    // Result voltou para nulo
    _result = null; // limpa o estado anterior
    notifyListeners(); // notifica os ouvintes sobre a mudança de estado

    try {
      _result = await action(); // executa a action e aguarda o resultado
      print("_result: $_result");

    } finally {
      _running = false; // marca como não em execução
      notifyListeners(); // notifica os ouvintes sobre a mudança de estado
    }
  }
}


class Command0<Output extends Object> extends Command<Output> {
 final CommandAction0<Output> action;

 Command0(this.action);

  Future<void> execute() async {
    return _execute(action);
  }
}

class Command1<Output extends Object, Input extends Object> extends Command<Output> {
 final CommandAction1<Output, Input> action;

 Command1(this.action);

  Future<void> execute(Input params) async {
    return _execute(() => action(params));
  }
}


