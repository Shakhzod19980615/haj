import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/colors/colors.dart';
import 'package:haj/constants/themes.dart';
import 'package:haj/model/demo_model.dart';
import 'package:haj/screens/main/widgets/image_container.dart';
import 'package:haj/screens/main/widgets/main_list_item.dart';
import 'package:haj/screens/main/widgets/pop_up_menu_button.dart';

import '../../theme/theming_cubit.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {

  bool isNotificationOn = false;
  bool isNightModeOn = false;
  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Scaffold(
      //backgroundColor: Color(0xFF2C6E4F),
      appBar: AppBar(
        primary: true,
        elevation: 0,
        backgroundColor: theme.isDark? darkColorBk : Color(0xFF2C6E4F),
        actions: [
          textSizePopupMenuButton(BlocProvider.of(context))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: theme.isDark? darkColorBk : Color(0xFF2C6E4F),
        child: Column(
          children: [
            ImageContainer(),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height - 90,
                clipBehavior: Clip.antiAlias,
                decoration:  BoxDecoration(
                    color: theme.isDark? darkerColor : Colors.white,

                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 30),
                    itemCount: demoList.length,
                    itemBuilder: (context,index){
                      return MainListItem(model: demoList[index],isTopItem: index ==0,);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
