import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/screens/context/widget/zikr_list_item.dart';

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
          PopupMenuButton(
              icon: SvgPicture.asset("assets/images/menu_logo.svg",width: 20,height: 20,),
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          margin:EdgeInsets.only(right: 40),
                          child: Text("Sozlamalar",
                            style: TextStyle(
                                color: Color(0xFF2C6E4F),
                                fontSize: 20,fontWeight: FontWeight.w700),),
                        ),
                        SvgPicture.asset("assets/images/menu_green_logo.svg",color: Color(0xFF2C6E4F),)
                      ],
                    )),
                PopupMenuItem(
                    child: Row(
                      children: [
                        Spacer(),
                        Switch(value: isNotificationOn, onChanged: (onChanged){
                          setState(() {
                            isNotificationOn = onChanged;
                          });
                        }),
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Text("Bildirish",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,color: Color(0xFF2C6E4F)),),
                        ),
                        Icon(Icons.notifications_active,color: Color(0xFFC7C7C7),)
                      ],
                    )),
                PopupMenuItem(child:
                Row(children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text("Ilova tili",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,color: Color(0xFF2C6E4F)),),
                  ),
                  Icon(Icons.language,color: Color(0xFFC7C7C7),),
                ],)
                ),
                PopupMenuItem(
                    child: Row(
                      children: [
                        Spacer(),
                        Switch(value: isNightModeOn, onChanged: (onChanged){
                          setState(() {
                            isNightModeOn = onChanged;
                          });
                        }),
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Text("Tungi rejim",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,color: Color(0xFF2C6E4F)),),
                        ),
                        Icon(Icons.nightlight,color: Color(0xFFC7C7C7),)
                      ],
                    )),
                PopupMenuItem(child:
                Row(children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text("Murojaat",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,color: Color(0xFF2C6E4F)),),
                  ),
                  Icon(Icons.message,color: Color(0xFFC7C7C7),),

                ],)
                ),
                PopupMenuItem(child:
                Row(children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text("Ulashish",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,color: Color(0xFF2C6E4F)),),
                  ),
                  Icon(Icons.share,color: Color(0xFFC7C7C7),),
                ],)
                ),
                PopupMenuItem(child:
                Row(children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text("Ilova haqida",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,color: Color(0xFF2C6E4F)),),
                  ),
                  SvgPicture.asset("assets/images/about_logo.svg",color: Color(0xFFC7C7C7),),

                ],)
                ),
              ]),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF2C6E4F),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*1.2,
              height: 90,
              child: Stack(
                children: [
                  Positioned(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      bottom: 20,
                      child: SvgPicture.asset(
                        "assets/images/wave_2.svg",
                      )),
                  Positioned(
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      bottom: -1,
                      child: SvgPicture.asset(
                        "assets/images/wave_1.svg",
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
                        "assets/images/camel-1.svg",
                      )),
                  Positioned(
                      width: 40,
                      height: 35,
                      left: 100,
                      child: SvgPicture.asset(
                        "assets/images/camel-2.svg",
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
            ),
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
