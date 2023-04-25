import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/loading_page.dart';
import 'package:twitter/features/auth/controller/auth_controller.dart';
import 'package:twitter/features/auth/view/login_view.dart';

import '../../../common/rounded_small_button.dart';
import '../../../constants/ui_constants.dart';
import '../../../theme/pallete.dart';
import '../widgets/auth_field.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route()=>MaterialPageRoute(builder: (context)=>const SignUpView());
  const SignUpView({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar=UIConstants.appBar();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }
  void onSignUp(){
    final res=ref.read(authControllerProvider.notifier).signUp(email: emailController.text, password: passwordController.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading=ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading?Loader():Center(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal:20 ),
            child: Column(
              children: [

                AuthField(controller:emailController,
                  hintText: 'email',),
                const SizedBox(height: 25,),
                AuthField(controller:passwordController,
                  hintText: 'password',),
                const SizedBox(height: 25,),
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(onTap: onSignUp,
                    lable: "Done",
                    backgroundColor: Pallete.whiteColor,
                    textColor: Pallete.backgroundColor,
                  ),
                ),
                const SizedBox(height: 25,),
                RichText(text: TextSpan(
                    text:" Already have an account?",
                    children: [
                      TextSpan(
                        text:' Login',
                        style:const  TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()..onTap=(){
                          Navigator.push(context,LoginView.route());
                        },
                      )
                    ]
                ),
                ),
              ],

            ),),
        ),
      ),
    );
  }
}
