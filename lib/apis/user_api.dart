import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/constant/appwrite_constant.dart';
import 'package:twitter/core/core.dart';
import 'package:twitter/core/provider.dart';
import 'package:twitter/model/user_model.dart';

abstract class Iuser {
  ResultEitherVoid saveUserData(Usermodel usermodel);
  Future<model.Document> getUserData(String uid);
}

final userApiProvider = Provider((ref) {
  return UserAuth(db: ref.watch(appwriteDatabaseProvider));
});

class UserAuth implements Iuser {
  final Databases _db;
  UserAuth({required Databases db}) : _db = db;
  @override
  ResultEitherVoid saveUserData(Usermodel usermodel) async {
    try {
      await _db.createDocument(
          databaseId: AppwriteConstant.databaseId,
          collectionId: AppwriteConstant.documentId,
          documentId: usermodel.uid,
          data: usermodel.toMap());
      return right(null);
    } on AppwriteException catch (e, str) {
      return left(
          Failure(message: e.message ?? 'some error ocured', stackTrace: str));
    } catch (e, str) {
      return left(Failure(message: e.toString(), stackTrace: str));
    }
  }

  @override
  Future<model.Document> getUserData(String uid)  {
    return _db.getDocument(
        databaseId: AppwriteConstant.databaseId,
        collectionId: AppwriteConstant.documentId,
        documentId: uid);
  }
}
