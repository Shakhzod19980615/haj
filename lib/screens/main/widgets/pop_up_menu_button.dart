import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/extentions/extention.dart';

import '../../../theme/theming_cubit.dart';

 PopupMenuButton<int> textSizePopupMenuButton(){

  bool isNotificationOn = false;
  bool isNightModeOn = false;
  return PopupMenuButton(

      icon: SvgPicture.asset("assets/images/menu_logo.svg",width: 20,height: 20,),
      itemBuilder: (context) => [
        PopupMenuItem(
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text("Созламалар",
                    style: TextStyle(
                        color: Color(0xFF2C6E4F),
                        fontSize: 20,fontWeight: FontWeight.w700),),
                ),
                Container(
                    margin: EdgeInsets.only(right: 20),
                    child: SvgPicture.asset("assets/images/menu_green_logo.svg",color: Color(0xFF2C6E4F),)),

              ],
            )),
        PopupMenuItem(
            child: Row(
              children: [
                Spacer(),
                Switch(value: isNotificationOn, onChanged: (onChanged){

                }),
                Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Text("Билдириш",
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
            child: Text("Илова тили",
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
                  isNightModeOn = true;
                }),
                Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Text("Тунги режим",
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
            child: Text("Мурожаат",
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
            child: Text("Улашиш",
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
            child: Text("Илова ҳақида",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,color: Color(0xFF2C6E4F)),),
          ),
          SvgPicture.asset("assets/images/about_logo.svg",color: Color(0xFFC7C7C7),),

        ],)
        ),
      ]);
}