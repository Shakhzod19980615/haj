import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MySvgPictureButton extends StatefulWidget {

  final String icon;
  final Function function;
  final Color svgColor;

  const MySvgPictureButton({Key? key, required this.icon, required this.function, required this.svgColor}) : super(key: key);

  @override
  State<MySvgPictureButton> createState() => _MySvgPictureButtonState();
}

class _MySvgPictureButtonState extends State<MySvgPictureButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: (){
          widget.function();
        },
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: SvgPicture.asset(widget.icon,color: widget.svgColor,),
          )),

    );
  }
}

