import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haj/colors/colors.dart';
import 'package:haj/model/umra_model.dart';
import 'package:haj/screens/main/widgets/animation.dart';
import 'package:haj/screens/main/widgets/main_list_item.dart';
import 'package:haj/screens/main/widgets/pop_up_menu_button.dart';

import '../../db/database_helper.dart';
import '../../theme/theming_cubit.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
// void Function() onTap;
// bool playing;
}

class _MainMenuPageState extends State<MainMenuPage>
    with SingleTickerProviderStateMixin {
  final dbhelper = DatabaseHelper.instance;
  Animation<double>? animation;
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
    AnimationController(duration: const Duration(seconds: 10), vsync: this)
      ..repeat();

    animation = Tween<double>(begin: -500, end: 0).animate(_controller);
  }

  bool isNotificationOn = false;
  bool isNightModeOn = false;
  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Scaffold(
      //backgroundColor: Color(0xFF1E4A35),
      appBar: AppBar(
        primary: true,
        elevation: 0,
        backgroundColor: theme.isDark ? darkColorBk : const Color(0xFF2C6E4F),
        actions: [textSizePopupMenuButton(BlocProvider.of(context))],
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
                color: theme.isDark ? darkColorBk : const Color(0xFF2C6E4F),
                child: Stack(
                  children: [
                    if (animation != null) MyClipPath(animation!, () {}, true),
                    Column(
                      children: [
                        const SizedBox(
                          height: 125,
                        ),
                        Expanded(
                          child: Container(
                            // height: MediaQuery.of(context).size.height - 90,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color:
                                theme.isDark ? darkerColor : Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32))),
                            child: ListView.builder(
                                padding: const EdgeInsets.only(top: 30),
                                itemCount: list.length ?? 0,
                                itemBuilder: (context, index) {
                                  return MainListItem(
                                    title: list.keys.toList()[index] ?? "",
                                    sublist: list.values.toList()[index],
                                    isTopItem: index == 0,
                                  );
                                }),
                          ),
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
