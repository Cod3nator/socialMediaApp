import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter/core/core.dart';
import 'package:twitter/core/provider.dart';


final authAPIProvider=Provider((ref){
  return AuthAPI(account:ref.watch(appwriteAccountProvider));
});


abstract class IAuthAPI{

  FutureEither<model.User> signUp({
    required String email,
    required String password,
});

}

 class AuthAPI implements IAuthAPI{
  final Account _account;
  AuthAPI({required Account account}): _account=account;

  @override
  FutureEither<model.User> signUp({
    required String email,
    required String password
  }) async{
    try{
      final account = await _account.create(userId: ID.unique(), email: email,
       password: password);
      return Either.right(account);
    }on AppwriteException catch(e,stackTrace){
      return Either.left(
        Failure(e.message as String, stackTrace)
      );
    }
    catch(e,stackTrace){
      return Either.left(Failure(e.toString(),stackTrace));
    }
  }

  

}