import 'package:dartz/dartz.dart';
import 'package:twitter/core/core.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultEitherVoid = ResultFuture<void>;
typedef ResultVoid = Future<void>;
