import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<bool>{
  AuthController(super.state);

  void signUp({
  required String email,
    required String password,
    required BuildContext context,
})async{
    state=true;
    final res;

  }

}