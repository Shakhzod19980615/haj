import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haj/extentions/extention.dart';
import 'package:haj/screens/home_page.dart';
import 'package:haj/screens/main/main_menu_page.dart';

import '../theme/theming_cubit.dart';

class TripDirectionPage extends StatefulWidget {
  const TripDirectionPage({Key? key}) : super(key: key);

  @override
  State<TripDirectionPage> createState() => _TripDirectionPageState();
}

class _TripDirectionPageState extends State<TripDirectionPage> {
  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Scaffold(
      backgroundColor:Colors.white,
      body:Center(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/images/location_image.svg"),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(

                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  margin: EdgeInsets.only(top: 50,bottom: 30),
                  decoration: BoxDecoration(
                      color: Color(0xFFD6F0E3),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Text("ЎЗБЕКИСТОН".toLatin(theme.isLatin),style: TextStyle(color: Color(0xFF429E73),fontSize: 20,fontWeight: FontWeight.w700),),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Icon(Icons.arrow_downward,color: Color(0xFF429E73),)),
                      Text("МАККА".toLatin(theme.isLatin),style: TextStyle(color: Color(0xFF429E73),fontSize: 20,fontWeight: FontWeight.w700),),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(

                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  margin: EdgeInsets.only(top: 0,bottom: 30),
                  decoration: BoxDecoration(
                      color: Color(0xFFD6F0E3),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Text("ЎЗБЕКИСТОН".toLatin(theme.isLatin),style: TextStyle(color: Color(0xFF429E73),fontSize: 20,fontWeight: FontWeight.w700),),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Icon(Icons.arrow_downward,color: Color(0xFF429E73),)),
                      Text("МАДИНА".toLatin(theme.isLatin),style: TextStyle(color: Color(0xFF429E73),fontSize: 20,fontWeight: FontWeight.w700),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
