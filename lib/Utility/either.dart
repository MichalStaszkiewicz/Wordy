class Either<Exception, R> {
  final Exception? left;
  final R? right;

  Either.error(this.left) : right = null;
  Either.data(this.right) : left = null;

  bool get isLeft => left != null;
  bool get isRight => right != null;
}
