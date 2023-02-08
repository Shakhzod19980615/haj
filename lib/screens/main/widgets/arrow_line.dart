import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArrowLine extends StatelessWidget {
  const ArrowLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VerticalDivider(
          color: Color(0xFF429E73),
          thickness: 5,
        ),
        Container(
            margin: EdgeInsets.only(top: 40,left: 10),
            child: SvgPicture.asset("assets/images/filled_arrow.svg")),
      ],
    );
  }
}
