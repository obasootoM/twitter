import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/constant/constant.dart';

final appwriteClientProvider = Provider((ref) {  //appwrite for client
  Client client = Client();
  return client
      .setEndpoint(AppwriteConstant.endpoint)
      .setProject(AppwriteConstant.projectId)
      .setSelfSigned(status: true);
});

final appwriteAccountProvider = Provider((ref) { // appwrite for account
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});

final appwriteDatabaseProvider = Provider((ref) {  //appwrite for database
  final db = ref.watch(appwriteClientProvider);
  return Databases(db);
});
