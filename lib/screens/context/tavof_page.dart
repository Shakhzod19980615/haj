import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haj/colors/colors.dart';
import 'package:haj/model/tavof_model.dart';
import 'package:haj/screens/context/widget/tavof_list_item.dart';

import '../../db/database_helper.dart';
import '../../model/umra_model.dart';
import '../../theme/theming_cubit.dart';
import '../main/widgets/animation.dart';
import '../main/widgets/main_list_item.dart';
import '../main/widgets/pop_up_menu_button.dart';

class TavofPage extends StatefulWidget {
  const TavofPage({Key? key}) : super(key: key);

  @override
  State<TavofPage> createState() => _TavofPageState();
}

class _TavofPageState extends State<TavofPage> with SingleTickerProviderStateMixin{
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
      body:FutureBuilder<List<TavofModel>>(
        future: dbhelper.getTavofData(),
        builder: (context, snapshot) {
        if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
        } else {
        var list = snapshot.data;

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
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color:
                          theme.isDark ? darkerColor : Color(0xFFD6F0E3),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 30),
                          itemCount: list!.length ?? 0,
                          itemBuilder: (context, index1) {
                            return TavofListItem(
                              tavofList: list,
                              index: index1,

                            );
                          }),
                    ),
                  )
                ],
              )
            ],
          ),
        );
    }}
      )
    );
  }
}
