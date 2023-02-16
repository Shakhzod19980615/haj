import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haj/screens/home_page.dart';
import 'package:haj/settings/settings_provider.dart';
import 'package:provider/provider.dart';

import '../theme/theming_cubit.dart';

class ChooseLanguagePage extends StatefulWidget {
  const ChooseLanguagePage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();

}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  @override
  void initState() {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    super.initState();
    theme.init();
    theme.getLang();
  }

  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Consumer<SettingsProvider>(builder: (context, provider, child) {
      return Scaffold(
      backgroundColor:Colors.white,
      body: Center(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/images/lang_image.svg"),
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          provider.changeLanguageToTrue();
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => HomePage(

                        ),
                        ),);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                          margin: EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                              color: Color(0xFFD6F0E3),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text("O‘ZBEK",style: TextStyle(color: Color(0xFF2C6E4F),fontSize: 24,fontWeight: FontWeight.w700),)
                      ),
                    ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        provider.changeLanguageToFalse();
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(

                          ),
                        ),
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            color: Color(0xFFD6F0E3),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("ЎЗБЕК",style: TextStyle(color: Color(0xFF2C6E4F),fontSize: 24,fontWeight: FontWeight.w700),)
                    ),
                  )
                ],
              ),
            ),
      ),
    );
  });
  }
}
