import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/colors/colors.dart';

import '../../../theme/theming_cubit.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Container(
      width: MediaQuery.of(context).size.width*1.2,
      height: 90,
      child: Stack(
        children: [
          Positioned(
              width: MediaQuery.of(context).size.width,
              height: 65,
              bottom: 20,
              child: SvgPicture.asset(
                "assets/images/wave_2.svg",color: theme.isDark?darkCard:wave_2 ,
              )),
          Positioned(
              width: MediaQuery.of(context).size.width,
              height: 75,
              bottom: -1,
              child: SvgPicture.asset(
                "assets/images/wave_1.svg", color: theme.isDark? darkerColor : wave_1,
              )),
          Positioned(
              width: 55,
              height: 60,
              left: 50,
              bottom: 0,
              child: SvgPicture.asset(
                "assets/images/walking_man.svg",
              )),
          Positioned(
              width: 40,
              height: 35,
              right: 150,
              child: SvgPicture.asset(
                "assets/images/camel-1.svg",color: theme.isDark?white:wave_1,
              )),
          Positioned(
              width: 40,
              height: 35,
              left: 100,
              child: SvgPicture.asset(
                "assets/images/camel-2.svg",color: theme.isDark?white:wave_1,
              )),
          Positioned(
              width: 85,
              height: 80,
              right: 35,
              bottom: 0,
              child: SvgPicture.asset(
                "assets/images/kaba1.svg",
              )),
        ],
      ),
    );
  }
}
