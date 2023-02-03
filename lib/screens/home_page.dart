import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Haj va Umra",
          style: TextStyle(
              color: Color(0xFF0072FF),
              fontSize: 20),
              textAlign: TextAlign.center,),
      ),
    );
  }
}
