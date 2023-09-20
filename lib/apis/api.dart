import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/core/failure.dart';
import 'package:twitter/core/provider.dart';
import 'package:twitter/core/typedef.dart';
import 'package:appwrite/models.dart' as model;

final authProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return Authapi(account: account);
});

abstract class IauthApi {
  ResultFuture<model.Account> signup(
      {required String email, required String password});
  ResultFuture<model.Session> login(
      {required String email, required String password});
  Future<model.Account?> currentUserAccount();
}

class Authapi implements IauthApi {
  final Account _account;
  const Authapi({required Account account}) : _account = account;
  @override
  ResultFuture<model.Account> signup(
      {required String email, 
      required String password}) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), 
          email: email, 
          password: password);
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(
          message: e.message ?? 'expected error occured',
          stackTrace: stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(message: e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  ResultFuture<model.Session> login(
      {required String email, required String password}) async {
    try {
      final session =
          await _account.createEmailSession(email: email, password: password);
      return right(session);
    } on AppwriteException catch (e, str) {
      return left(Failure(
          message: e.message ?? 'unexpected error occured', stackTrace: str));
    } catch (e, str) {
      return left(Failure(message: e.toString(), stackTrace: str));
    }
  }

  @override
 Future<model.Account?> currentUserAccount() async {
    try {
      return await _account.get();
    } on AppwriteException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
