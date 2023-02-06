import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/model/demo_model.dart';
import 'package:haj/screens/main/widgets/main_list_item.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF2C6E4F),
      appBar: AppBar(
        primary: true,
        elevation: 0,
        backgroundColor: Color(0xFF2C6E4F),
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.menu_open_outlined,
                color: Colors.white,
              ),
              itemBuilder: (context) => [PopupMenuItem(child: Text("sadasd"))])
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF2C6E4F),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
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
                // height: MediaQuery.of(context).size.height - 90,
                padding: const EdgeInsets.only(bottom: 0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: ListView.builder(
                    itemCount: demoList.length,
                    itemBuilder: (context,index){
                      return MainListItem(model: demoList[index]);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
