abstract class Result<T extends Object> {
  const Result();

  factory Result.ok(T value) = Ok._; // TearsOff
  // factory Result.ok(T value) => Ok._(value);  // assim tb está certo

  factory Result.error(Exception error) = Error._;
  // factory Result.error(Exception error) => Error._(error); // assim tb está certo

  // factory Result.ok) = Ok._;
}

final class Ok<T extends Object> extends Result<T> {
  final T value;
  // Ok(this.value);
  Ok._(this.value); // construtor interno
  // não é possível criar instâncias de Ok fora do arquivo result.dart
}

final class Error<T extends Object> extends Result<T> {
  final Exception error;
  Error._(this.error); // construtor interno
  // não é possível criar instâncias de Error fora do arquivo result.dart
}

extension ResultExtension on Object {
  Result ok() {
    return Result.ok(this);
  }
}

extension ResultException on Exception {
  Result error() {
    return Result.error(this);
  }
}

extension ResultCasting<T extends Object> on Result<T> {
  Ok<T> get asOk => this as Ok<T>;

  Error<T> get asError => this as Error<T>;
}

// // exemplo de uso:
// Result isPar(int number) {
//   if(number %2 ==0) {
//     // return Result.ok('Par');
//     return 'Par'.ok();

//   } else {
//     // return Result.error(Exception('Impar'));
//     return Exception('Impar').error();
//   }
// }

// void main() {
//   final resultado = isPar(2);

//   if (resultado is Ok) {
//     print('Resultado: ${resultado.asOk.value  } \n');
//     print('Resultado: ${(resultado as Ok).value  }');
    
//   } else {
//     print('Resultado: ${resultado.asError.error } \n');
//     print('Resultado: ${(resultado as Error).error }');
    
//   }
// }
