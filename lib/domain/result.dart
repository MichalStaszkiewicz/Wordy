class Result<T> {
  final T? data;
  final Exception? error;

  Result({this.data, this.error});

  bool get hasError => error != null;
}
