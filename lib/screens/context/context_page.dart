import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/colors/colors.dart';
import 'package:haj/extentions/extention.dart';
import 'package:haj/screens/context/widget/svgPictureButton.dart';
import 'package:haj/screens/context/widget/tavof_list_item.dart';
import 'package:haj/screens/main/widgets/image_container.dart';
import 'package:haj/screens/main/widgets/pop_up_menu_button.dart';

import '../../db/database_helper.dart';
import '../../model/demo_model.dart';
import '../../model/umra_model.dart';
import '../../theme/theming_cubit.dart';
import '../main/widgets/animation.dart';
import '../main/widgets/main_list_item.dart';

class ContextPage extends StatefulWidget {
   ContextPage({Key? key,
    required this.content,
    }) : super(key: key);
  final String content;
  // final List<UmraModel>? sublist;
  final dbhelper = DatabaseHelper.instance;
  //final bool isTopItem;
  @override
  State<ContextPage> createState() => _ContextPageState();
}

class _ContextPageState extends State<ContextPage> with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  late AnimationController _controller;
  final dbhelper = DatabaseHelper.instance;
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
      body: FutureBuilder<List<UmraModel>>(
        future: dbhelper.getUmraMainMenu(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var list = groupBy(snapshot.data!, (p0) => p0.titleBig);

            return Container(

              color: theme.isDark ? darkColorBk : Color(0xFF2C6E4F),
              child: Stack(
                children: [
                  MyClipPath(animation!, () {}, true),
                  Column(
                    children: [
                      SizedBox(
                        height: 125,
                      ),
                      Expanded(
                          child: Container(
                            //margin: EdgeInsets.symmetric(horizontal: 17),
                            decoration:  BoxDecoration(
                              color: theme.isDark? darkerColor : Color(0xFFD6F0E3),
                              borderRadius: BorderRadius.only(
                                topRight:
                                Radius.circular(15),
                                topLeft: Radius.circular(15)
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                                            child: Html(data: widget.content.replaceTags().toLatin(theme.isLatin),
                                            style: {
                                              'body': Style(

                                                  fontSize: const FontSize(16),
                                                  color: theme.isDark? white: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            },),
                                          ),
                                        ),
                                        Container(
                                          color: Color(0xFF2C6E4F),
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
                                  ),
                                  // Padding(
                                  //   padding:  const EdgeInsets.only(right: 12.0),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //     children: [
                                  //       MySvgPictureButton(
                                  //           icon : 'assets/images/size_icon.svg',
                                  //           function: () {},
                                  //           svgColor: Colors.white),
                                  //       MySvgPictureButton(
                                  //           icon : 'assets/images/book_icon.svg',
                                  //           function: () {},
                                  //           svgColor: Colors.white),
                                  //       MySvgPictureButton(
                                  //           icon : 'assets/images/play_audio_icon.svg',
                                  //           function: () {},
                                  //           svgColor: Colors.white),
                                  //       Container(
                                  //         height: 30,
                                  //         width: 30,
                                  //         decoration: BoxDecoration(
                                  //           borderRadius: const BorderRadius.all(
                                  //               Radius.circular(5)),
                                  //           border: Border.all(
                                  //             color: Colors.white,
                                  //             width: 3,
                                  //           ),
                                  //         ),
                                  //         child: Center(
                                  //           child: Text(
                                  //             "2",
                                  //             style: const TextStyle(
                                  //                 color: Colors.white,
                                  //                 fontWeight: FontWeight.bold),
                                  //           ),
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),)

                                ],
                              ),
                            ),
                          )
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        }),
    );
  }
}
