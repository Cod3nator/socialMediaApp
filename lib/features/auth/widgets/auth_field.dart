import 'package:flutter/material.dart';
import 'package:twitter/constants/constants.dart';
import 'package:twitter/theme/pallete.dart';
class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const  AuthField({required this.controller
 , required this.hintText});


  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:  BorderSide(
            color: Pallete.blueColor,
            width:3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide:  BorderSide(
    color: Pallete.greyColor,
    width:3,
        ),
        ),
        contentPadding: const EdgeInsets.all(22),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        )
      ),

    );
  }
}