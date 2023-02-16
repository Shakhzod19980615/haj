import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/model/demo_model.dart';
import 'package:haj/screens/main/widgets/image_container.dart';
import 'package:haj/screens/main/widgets/main_list_item.dart';
import 'package:haj/screens/main/widgets/pop_up_menu_button.dart';

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
    return Scaffold(
      //backgroundColor: Color(0xFF2C6E4F),
      appBar: AppBar(
        primary: true,
        elevation: 0,
        backgroundColor: Color(0xFF2C6E4F),
        actions: [
          textSizePopupMenuButton()
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF2C6E4F),
        child: Column(
          children: [
            ImageContainer(),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height - 90,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    color: Colors.white,

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
