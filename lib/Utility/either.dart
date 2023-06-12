class Either<Exception, R> {
  final Exception? error;
  final R? data;

  Either.error(this.error) : data = null;
  Either.data(this.data) : error = null;

  bool get isError => error != null;
  bool get isData => data != null;
}
