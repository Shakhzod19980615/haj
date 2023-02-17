import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../colors/colors.dart';
import '../../../theme/theming_cubit.dart';

class ArrowLine extends StatelessWidget {
  const ArrowLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Stack(
      children: [
        VerticalDivider(
          color: theme.isDark? white: Color(0xFF429E73),
          thickness: 5,
        ),
        Container(
            margin: EdgeInsets.only(top: 40,left: 10),
            child: SvgPicture.asset("assets/images/filled_arrow.svg",color: theme.isDark? white:Color(0xFF429E73),)),
      ],
    );
  }
}
