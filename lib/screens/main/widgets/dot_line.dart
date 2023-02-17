import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haj/colors/colors.dart';

import '../../../theme/theming_cubit.dart';

class DotLine extends StatelessWidget {
  const DotLine({Key? key,this.padding,required this.isTop}) : super(key: key);
  final EdgeInsets? padding;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Container(
      padding: isTop?padding:null,
      child: Stack(
        children: [

           VerticalDivider(
            color: theme.isDark? white:  Color(0xFF429E73),
            thickness: 5,
          ),


          Padding(
            padding:!isTop?padding??EdgeInsets.zero:EdgeInsets.zero,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    color: theme.isDark? white: Color(0xFF2C6E4F),
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
