import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haj/model/demo_model.dart';
import 'package:haj/screens/main/widgets/submain_list_item.dart';

class MainListItem extends StatelessWidget {
  const MainListItem({Key? key,required this.model}) : super(key: key);
  final DemoModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          margin: EdgeInsets.only(top: 30),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text('')),
                VerticalDivider(
                  color: Color(0xFF429E73),
                  thickness: 3,
                ),
                Icon(Icons.pie_chart,color:Color(0xFF2C6E4F)),
                Container(
                  margin: EdgeInsets.only(left: 10),
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
            itemCount: model.subList?.length??0,
            shrinkWrap: true,
            itemBuilder:(context,index){
          return IntrinsicHeight(
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text('')),
                VerticalDivider(
                  color: Color(0xFF429E73),
                  thickness: 3,
                ),
                Icon(Icons.arrow_forward_ios,color:Color(0xFF2C6E4F)),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  margin:EdgeInsets.only(top: 20,left: 0),
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
                              margin:EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(18)),
                                color: Color(0xFF429E73)
                              ),
                              child: Text(model.subList?[index].subTitle??"",
                              style: TextStyle(color: Colors.white,fontSize: 17,
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
