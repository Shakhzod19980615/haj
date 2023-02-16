import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/screens/context/widget/zikr_list_item.dart';
import 'package:haj/screens/main/widgets/image_container.dart';
import 'package:haj/screens/main/widgets/pop_up_menu_button.dart';

import '../../model/demo_model.dart';
import '../main/widgets/main_list_item.dart';

class ContextPage extends StatefulWidget {
  const ContextPage({Key? key}) : super(key: key);

  @override
  State<ContextPage> createState() => _ContextPageState();
}

class _ContextPageState extends State<ContextPage> {
  bool isNotificationOn = false;
  bool isNightModeOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Color(0xFFD6F0E3),
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
            )
          ],
        ),
      ),
    );
  }
}
