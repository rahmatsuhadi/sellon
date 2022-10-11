import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sellon/constant.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: defaultPadding * 2,
        ),
        // SvgPicture.asset(
        //   "assets/images/logo.svg",
        //   height: 130,
        //   width: 130,
        // ),
        Text(
          "Minemarket",
          style:
              TextStyle(fontFamily: 'Abe', fontSize: 30, color: color),
        ),
        Text(
          "Selling stuff in a cool way",
          style: TextStyle(
              color: color, fontSize: 11, fontFamily: 'Poppin'),
        )
      ],
    ));
  }
}
