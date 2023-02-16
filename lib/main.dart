import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haj/screens/choose_language_page.dart';
import 'package:haj/screens/home_page.dart';
import 'package:haj/settings/settings_provider.dart';
import 'package:haj/theme/theming_cubit.dart';
import 'package:provider/provider.dart';


void main() {

  runApp(
    ChangeNotifierProvider(
        create:(context) => SettingsProvider()..initState(),
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //ThemingCubit theme = BlocProvider.of<ThemingCubit>(context, listen: true);
    return Consumer<SettingsProvider>(
        builder: (context, provider, child) {
      return MaterialApp(
        color: Colors.transparent,
        debugShowCheckedModeBanner: false,
        home: ChooseLanguagePage(),
      );
    });
  }
}

