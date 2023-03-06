import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/colors/colors.dart';
import 'package:haj/screens/context/widget/zikr_list_item.dart';
import 'package:haj/screens/main/widgets/image_container.dart';
import 'package:haj/screens/main/widgets/pop_up_menu_button.dart';

import '../../model/demo_model.dart';
import '../../theme/theming_cubit.dart';
import '../main/widgets/animation.dart';
import '../main/widgets/main_list_item.dart';

class ContextPage extends StatefulWidget {
  const ContextPage({Key? key}) : super(key: key);

  @override
  State<ContextPage> createState() => _ContextPageState();
}

class _ContextPageState extends State<ContextPage> with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  late AnimationController _controller;
  bool isNotificationOn = false;
  bool isNightModeOn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
    AnimationController(duration: Duration(seconds: 10), vsync: this)
      ..repeat();

    animation = Tween<double>(begin: -500, end: 0).animate(_controller);
  }
  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        primary: true,
        elevation: 0,
        backgroundColor: theme.isDark? darkColorBk: Color(0xFF2C6E4F),
        actions: [
          textSizePopupMenuButton(BlocProvider.of(context))
        ],
      ),
      body: Container(

        color: theme.isDark? darkColorBk: Color(0xFF2C6E4F),
        child: Stack(
          children: [
            MyClipPath(animation!,(){},true),
            Column(
              children: [
                SizedBox(
                  height: 125,
                ),
                Expanded(
                    child: Container(

                      clipBehavior: Clip.antiAlias,
                      decoration:  BoxDecoration(
                          color: theme.isDark? darkCard: Color(0xFFD6F0E3),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),

                      child:ListView.builder(
                        padding: EdgeInsets.only(top: 30),
                        itemCount: 1,
                        itemBuilder: (context,index){
                          return ZikrListItem();
                    }
                    ),
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
