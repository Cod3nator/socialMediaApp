import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/assets_constants.dart';

class ReUsableAppBar extends StatefulWidget {
  const ReUsableAppBar({Key? key}) : super(key: key);

  @override
  State<ReUsableAppBar> createState() => _ReUsableAppBarState();
}

class _ReUsableAppBarState extends State<ReUsableAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsConstants.twitterLogo),
      ),
    );
  }
}
