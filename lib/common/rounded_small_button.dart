import 'package:flutter/material.dart';

import '../theme/pallete.dart';

class RoundedSmallButton extends StatelessWidget {
  final VoidCallback onTap;
  final String lable;
  final Color backgroundColor;
  final Color textColor;


  const RoundedSmallButton({
    super.key,required this.onTap, required this.lable, this.backgroundColor=Pallete.whiteColor, this.textColor=Pallete.backgroundColor
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(label: Text(lable,
      style: TextStyle(color: textColor,
        fontSize: 16,
      ),
      ),
      backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      ),
    );
  }
}
