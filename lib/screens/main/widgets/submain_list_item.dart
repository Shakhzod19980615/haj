import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haj/model/demo_model.dart';

class SubMainListItem extends StatelessWidget {
  const SubMainListItem({Key? key,required this.model}) : super(key: key);
  final DemoModel model;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demoList?.length??0,
      itemBuilder: ( context, index) {
      return Card(
        elevation: 50,
        shadowColor: Colors.white,
        child: Row(
          children: [
            Text(model.subList?[index].subTitle??"")
          ],
        ),
      );
      }
    );
  }
}
