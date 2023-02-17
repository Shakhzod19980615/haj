import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haj/extentions/extention.dart';
import 'package:haj/screens/context/widget/svgPictureButton.dart';

import '../../../colors/colors.dart';
import '../../../theme/theming_cubit.dart';

class ZikrListItem extends StatefulWidget {
  const ZikrListItem({Key? key}) : super(key: key);

  @override
  State<ZikrListItem> createState() => _ZikrListItemState();
}

class _ZikrListItemState extends State<ZikrListItem> {
  @override
  Widget build(BuildContext context) {
    ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: false);
    return Column(
        children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
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
                                        child:  Text("Birinchi shavt duosi",
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
                                        child: Text("سُبْحَانَ الهِ وَالْحَمْدُ للهِ وَلَ إِلَهَ إِلَّ الهُ وَ اله أَكْ بَرُ، وَلَ حَوْلَ وَلَ قُوَّةَ"
                                            " إِلَّ بِاللهِ العَلِ ي العَظِيْمِ وَالصَّ لَ ةُ وَالسَّلَ مُ عَلَى"
                                            " رَسُولِ اله صَ لَّي اله عَلَيْهِ وَسَلَّمَ، ال لهُمَّ إِيْمَان ا بِكَ وَتَصْدِيْق ا بِكِتَابِكَ وَوَفَا "
                                            "ء بَعَهْدِكَ وَ ات بَاع ا لِسُنَّةِ ن بِي كَ وَحَبِيْبِكَ مُ حَمَّدٍ صَلَّى الهُ عَلَيْ هِ وَسَلَّمَ. "
                                            "اللَّهُمَّ إِن ي أَسْ ألَُكَ العَفْ وَ وَ العَافِيَةَ وَ الْمُعَافَاةَ الدَّائ مَةَ فِي ال ديْنِ"
                                            " وَ الدُّنْيَا وَالآخِرَةَ وَالفَوزَ بِالْجَنَّةِ وَالن جَ اةَ مِ نَ النَّارِ.",
                                          style: TextStyle(fontSize: 16,color:theme.isDark? white:Colors.black, fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal),textAlign: TextAlign.right,),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                                        child: Text("«Субҳаналлоҳи валҳамду лиллаҳи вала илаҳа иллаллоҳу"
                                            " валлоҳу акбар валаа ҳавла валаа қуввата илла биллаҳил ъалиййил азийм."
                                            " Вассолату вассаламу ала расулиллаҳи соллаллоҳу алайҳи васаллам."
                                            " Аллоҳумма ийманан бика ва тасдийқон бикитабика вавафаан биъаҳдика"
                                            " ваттибаъан лисуннати набиййика ва ҳабибика "
                                            "Муҳаммадин соллаллоҳу алайҳи васаллам",
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
