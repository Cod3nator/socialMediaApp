import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter/features/auth/view/login_view.dart';

import '../../../common/rounded_small_button.dart';
import '../../../constants/ui_constants.dart';
import '../../../theme/pallete.dart';
import '../widgets/auth_field.dart';

class SignUpView extends StatefulWidget {
  static route()=>MaterialPageRoute(builder: (context)=>const SignUpView());
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
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
                  child: RoundedSmallButton(onTap: (){},
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
