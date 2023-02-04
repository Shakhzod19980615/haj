import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haj/screens/main_menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 90,left: 85,right: 85,bottom: 60),
        child: Column(
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
              child: Container(
                child: SvgPicture.asset("assets/images/haj.svg",width: 200,height: 200,),
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
              child: Container(
                margin: EdgeInsets.only(top:40),
                child: SvgPicture.asset("assets/images/umra.svg",width: 200,height: 200,),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Color(0xFFD6F0E3),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text("O'zbek",style: TextStyle(color: Color(0xFF2C6E4F),fontSize: 24,fontWeight: FontWeight.w700),)
            )
          ],
        ),
      ),
    );
  }
}
