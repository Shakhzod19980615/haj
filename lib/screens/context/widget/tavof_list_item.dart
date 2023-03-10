import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:haj/extentions/extention.dart';
import 'package:haj/model/tavof_model.dart';
import 'package:haj/screens/context/widget/svgPictureButton.dart';

import '../../../colors/colors.dart';
import '../../../db/database_helper.dart';
import '../../../model/umra_model.dart';
import '../../../theme/theming_cubit.dart';

class TavofListItem extends StatefulWidget {
   TavofListItem({Key? key,
    required this.tavofList, required this.index}) : super(key: key);

  //final String title;
  final List<TavofModel>? tavofList;
  final dbhelper = DatabaseHelper.instance;
  final int index;
  // final bool isTopItem;
  @override
  State<TavofListItem> createState() => _TavofListItemState();
}

class _TavofListItemState extends State<TavofListItem> {

  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Column(
        children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17,vertical: 10),
              decoration:  BoxDecoration(
                color: theme.isDark? darkerColor: Color(0xFF2C6E4F),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: theme.isDark? darkerColor: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                          InkWell(
                            onTap: (){},
                              child: Column(
                                  children: [
                                      Container(
                                        alignment:Alignment.center,
                                        margin: EdgeInsets.only(top: 20),
                                        child:  Text(widget.tavofList![widget.index].title??"",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: theme.isDark? white : Colors.black
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: theme.isDark ? darkColorBk : Color(0xFFF5F5F5),
                                        ),
                                        margin: const EdgeInsets.only(left: 14,right: 14,top: 14),
                                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        child: Html(data: widget.tavofList![widget.index].arab?.replaceTags().toLatin(theme.isLatin),
                                          style: {
                                            'body': Style(

                                                fontSize: const FontSize(18),
                                                color: theme.isDark? white: Colors.black,
                                                fontWeight: FontWeight.w700,textAlign: TextAlign.right),
                                          },),

                                      ),
                                      Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                                      child: Text(widget.tavofList![widget.index].transcription??"",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: theme.isDark? white: Colors.black,
                                            fontWeight: FontWeight.w500),),
                                    ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                                        child: Text(widget.tavofList![widget.index].uzbek??"",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: theme.isDark? white: Colors.black,
                                            fontWeight: FontWeight.w500),),
                                      )
                                  ],
                              ),
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MySvgPictureButton(
                            icon : 'assets/images/size_icon.svg',
                            function: () {},
                            svgColor: Colors.white),
                        MySvgPictureButton(
                            icon : 'assets/images/book_icon.svg',
                            function: () {},
                            svgColor: Colors.white),
                        MySvgPictureButton(
                            icon : 'assets/images/play_audio_icon.svg',
                            function: () {},
                            svgColor: Colors.white),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(5)),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: Text(
                             "2",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),)

                ],
              ),
            )
        ],
    );
  }
}
