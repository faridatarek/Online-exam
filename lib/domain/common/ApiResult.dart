/*sealed class Result<T>{}

class Success<T> implements Result<T>{
  T data;
  Success(this.data);
}
class Fail<T> implements Result<T>{
  Exception? exception;
  Fail(this.exception);
}*/
sealed class Result<T> {}

// Success case: holds the successful data
class Success<T> implements Result<T> {
  final T data;
  Success(this.data);
}

// Failure case: holds an exception for the failure
class Fail<T> implements Result<T> {
  final Exception? exception;
  Fail(this.exception);
}