import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/colors/colors.dart';
import 'package:haj/extentions/extention.dart';
import 'package:haj/model/umra_model.dart';
import 'package:haj/screens/context/context_page.dart';
import 'package:haj/screens/context/tavof_page.dart';
import 'package:haj/screens/main/widgets/arrow_line.dart';
import 'package:haj/screens/main/widgets/dot_line.dart';

import '../../../db/database_helper.dart';
import '../../../theme/theming_cubit.dart';

class MainListItem extends StatelessWidget {
  MainListItem(
      {Key? key,
        required this.title,
        required this.sublist,
        required this.isTopItem})
      : super(key: key);
  //final DemoModel model;
  final String title;
  final List<UmraModel>? sublist;
  final dbhelper = DatabaseHelper.instance;
  final bool isTopItem;
  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                ),
                DotLine(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  isTop: isTopItem,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "$title".toLatin(theme.isLatin),
                    style: TextStyle(
                        color: theme.isDark ? white : const Color(0xFF2C6E4F),
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: sublist?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                    ),
                    ArrowLine(),
                    GestureDetector(
                      onTap: () {
                        if (sublist?[index].id == 7) {
                          showDialog(context: context, builder: (context)=>AlertDialog(
                            title: const Text('1 - ТАВОФНИ БОШЛАЙСИЗМИ?',style: TextStyle(
                              fontSize: 20,color: Color(0xFF1E4A35),fontWeight: FontWeight.w700
                            ),),
                            //content: const Text('БОШЛАШ'),
                            actions: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: theme.isDark? darkCard : Color(0xFFD6F0E3)
                                ),
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('БЕКОР ҚИЛИШ',style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E4A35)
                                  ),),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: theme.isDark? darkCard : Color(0xFFD6F0E3)
                                ),
                                child: TextButton(
                                  onPressed: () => Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TavofPage()
                                    ),),
                                  child: const Text('БОШЛАШ',style: TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w700,
                                      color: Color(0xFF1E4A35)
                                  ),),
                                ),
                              ),
                            ],

                          ));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ContextPage(content: sublist?[index].content??'',)
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: EdgeInsets.only(top: 10, left: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: theme.isDark ? darkColorBk : Color(0xFFD6F0E3),
                        ),

                        child: Padding(
                      padding: EdgeInsets.all(18.0),
                        child: Row(
                        children: [
                          Align(
                            alignment:Alignment.topLeft,
                            child: Container(
                               padding:EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(18)),
                                  color: theme.isDark? darkCard : Color(0xFF429E73)
                                ),
                                child: Text("${sublist?[index].title??""}".toLatin(theme.isLatin),
                                style: TextStyle(color: Colors.white,fontSize: 16,
                                fontWeight: FontWeight.w400),)),
                          ),
                          Spacer(),
                          Container(

                              child: SvgPicture.asset("${sublist?[index].image??""}",width: 100,height: 90,))
                        ],
                      ),
                    ),
                      ),
                    ),
                  ],
                ),
              );
              //SubMainListItem(model: demoList[index]);
            })
      ],
    );
  }
}
