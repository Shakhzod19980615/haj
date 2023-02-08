import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haj/model/demo_model.dart';
import 'package:haj/screens/main/widgets/arrow_line.dart';
import 'package:haj/screens/main/widgets/dot_line.dart';
import 'package:haj/screens/main/widgets/submain_list_item.dart';

class MainListItem extends StatelessWidget {
  const MainListItem({Key? key,required this.model,required this.isTopItem}) : super(key: key);
  final DemoModel model;
  final bool isTopItem;
  @override
  Widget build(BuildContext context) {
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
                DotLine(padding: EdgeInsets.only(top: 10,),isTop: isTopItem,),
                Container(
                  margin: EdgeInsets.only(left: 20,top: 10),
                  child: Text(model.title??"",
                    style: TextStyle(
                        color: Color(0xFF2C6E4F),
                        fontSize:20, fontWeight: FontWeight.w800 ),),
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: model.subList?.length??0,
            shrinkWrap: true,
            itemBuilder:(context,index){
          return IntrinsicHeight(
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15),
                ),
                ArrowLine(),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  margin:EdgeInsets.only(top: 10,left: 0),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    color: Color(0xFFD6F0E3),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Align(
                          alignment:Alignment.topLeft,
                          child: Container(
                             padding:EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(18)),
                                color: Color(0xFF429E73)
                              ),
                              child: Text(model.subList?[index].subTitle??"",
                              style: TextStyle(color: Colors.white,fontSize: 16,
                              fontWeight: FontWeight.w400),)),
                        ),
                        Spacer(),
                        Container(

                            child: SvgPicture.asset("assets/images/umra.svg",width: 100,height: 90,))
                      ],
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
