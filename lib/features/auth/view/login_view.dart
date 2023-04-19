import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter/common/rounded_small_button.dart';
import 'package:twitter/constants/constants.dart';
import 'package:twitter/features/auth/view/signup_view.dart';
import 'package:twitter/features/auth/widgets/auth_field.dart';
import 'package:twitter/theme/pallete.dart';

class LoginView extends StatefulWidget {
  static route()=> MaterialPageRoute(builder: (context)=>const LoginView(),);
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

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
          child: Padding(padding: EdgeInsets.symmetric(horizontal:20 ),
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
                text:" Don't have an account?",
                children: [
                  TextSpan(
                    text:' Sign Up',
                    style:const  TextStyle(
                      color: Pallete.blueColor,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer()..onTap=(){
                      Navigator.push(context,
                      SignUpView.route());
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
