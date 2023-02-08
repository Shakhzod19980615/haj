import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarModel extends StatefulWidget {
  const AppBarModel({Key? key}) : super(key: key);

  @override
  State<AppBarModel> createState() => _AppBarModelState();
}

class _AppBarModelState extends State<AppBarModel> {
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
      )
    );
  }
}
