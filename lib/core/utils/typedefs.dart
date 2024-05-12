import 'package:thortbal/core/error/failure.dart';

typedef ResultFuture<T> = Future<DataState<T>>;

abstract class DataState<T> {
  final T? data;
  final Failure? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(Failure error) : super(error: error);
}
