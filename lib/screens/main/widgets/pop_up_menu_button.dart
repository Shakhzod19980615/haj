

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/colors/colors.dart';
import 'package:haj/extentions/extention.dart';

import '../../../theme/theming_cubit.dart';



 PopupMenuButton<int> textSizePopupMenuButton(ThemingCubit theme){



   bool isNotificationOn = false;
  bool isDark = false;
  return PopupMenuButton(
      //color: theme.isDark? darkerColor : white,
      icon: SvgPicture.asset("assets/images/menu_logo.svg",width: 20,height: 20,),
      itemBuilder: (context) => [
        PopupMenuItem(
            padding: EdgeInsets.zero,
            child: StatefulBuilder(
              builder: (context,state){
              return Row(
                children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text("Созламалар".toLatin(theme.isLatin),
                      style: TextStyle(
                          color: theme.isDark? white : Color(0xFF2C6E4F),
                          fontSize: 20,fontWeight: FontWeight.w700),),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: SvgPicture.asset("assets/images/menu_green_logo.svg",color: theme.isDark?white: Color(0xFF2C6E4F),)),

                ],
              );},
            )),
        PopupMenuItem(
            child: Row(
              children: [
                Spacer(),
                Switch(value: isNotificationOn, onChanged: (onChanged){

                }),
                Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Text("Билдириш".toLatin(theme.isLatin),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,color: theme.isDark?white: Color(0xFF2C6E4F)),),
                ),
                Icon(Icons.notifications_active,color: Color(0xFFC7C7C7),)
              ],
            )),
        PopupMenuItem(
            onTap:() {

              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: ListTile(
                              title: Text(
                                'O\'zbek (Lotin)'.toLatin(theme.isLatin),
                                ),
                          ),

                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: ListTile(
                              title: Text(
                                'Ўзбек (Кирилл)'.toLatin(theme.isLatin),
                              ),
                            ),

                          )],
                      ),
                    );
                  });
            },

            child: StatefulBuilder(
              builder: (context,state) {
                return Row(
                  children: [

                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text("Илова тили".toLatin(theme.isLatin),

                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: theme.isDark ? white : Color(0xFF2C6E4F)),),
                  ),

                  Icon(Icons.language, color: Color(0xFFC7C7C7),),
                ],);
              })
        ),
        PopupMenuItem(

            child:  StatefulBuilder(
              builder: (context,state) {
                return Row(
                  children: [
                    Spacer(),
                    Switch(value: theme.isDark, onChanged: (bool value) {
                      theme.changeTheme(value);
                      state.call(
                          (){}
                      );
                    },),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Text("Тунги режим".toLatin(theme.isLatin),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,color: theme.isDark? white : Color(0xFF2C6E4F)),),
                    ),
                    Icon(Icons.nightlight,color: Color(0xFFC7C7C7),)
                  ],
                );
              }
            )),
        PopupMenuItem(child:
        Row(children: [
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Text("Мурожаат".toLatin(theme.isLatin),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,color: theme.isDark?white: Color(0xFF2C6E4F)),),
          ),
          Icon(Icons.message,color: Color(0xFFC7C7C7),),

        ],)
        ),
        PopupMenuItem(child:
        Row(children: [
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Text("Улашиш".toLatin(theme.isLatin),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,color: theme.isDark?white: Color(0xFF2C6E4F)),),
          ),
          Icon(Icons.share,color: Color(0xFFC7C7C7),),
        ],)
        ),
        PopupMenuItem(child:
        Row(children: [
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Text("Илова ҳақида".toLatin(theme.isLatin),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,color:theme.isDark?white: Color(0xFF2C6E4F)),),
          ),
          SvgPicture.asset("assets/images/about_logo.svg",color: Color(0xFFC7C7C7),),

        ],)
        ),
      ]);

}
