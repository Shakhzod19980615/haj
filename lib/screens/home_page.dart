import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haj/extentions/extention.dart';
import 'package:haj/screens/main/main_menu_page.dart';

import '../theme/theming_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    super.initState();
    theme.init();
    theme.getLang();
  }
  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 85),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainMenuPage(

                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      child: SvgPicture.asset("assets/images/haj.svg",width: 200,height: 200,),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text("ХАЖ".toLatin(theme.isLatin),
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF2C6E4F),
                              fontWeight: FontWeight.w900),))
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainMenuPage(

                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:20),
                      child: SvgPicture.asset("assets/images/umra.svg",width: 200,height: 200,),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text("УМРА".toLatin(theme.isLatin),
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF2C6E4F),
                          fontWeight: FontWeight.bold,),))
                  ],
                ),
              ),
             /* Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: Color(0xFFD6F0E3),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text("O'zbek",style: TextStyle(color: Color(0xFF2C6E4F),fontSize: 24,fontWeight: FontWeight.w700),)
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
