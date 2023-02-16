
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SettingsProvider extends ChangeNotifier {
  int fontSizeAr = 14;
  int fontSizeCr = 14;
  int fontSizeTranslate = 14;

  bool fontAr = true;
  bool fontCr = true;
  bool fontTranslate = true;
  SharedPreferences? pref;
  bool notifications = true;

  bool lightMode = true;
  bool activeMood = false;
  bool translateText = false;
  bool sound = true;
  bool offShow = true;
  bool hideIndexOfDay = true;
  bool hideIndexOfNight = true;
  bool autoStopAudio = false;

  /*String locationName = ''.getTranslated();*/


  SettingsProvider._();

  //static SettingsProvider instance = SettingsProvider._();
  static SettingsProvider instance = SettingsProvider._();
  factory SettingsProvider(){
    return instance;
  }


  void initState() async {
    pref = await SharedPreferences.getInstance();
    fontSizeAr = await pref?.getInt(
          "fontSizeAr",
        ) ??
        14;
    fontSizeCr = await pref?.getInt(
          "fontSizeCr",
        ) ??
        14;
    fontSizeTranslate = await pref?.getInt(
          "fontSizeTranslate",
        ) ??
        14;

    fontAr = await pref?.getBool("fontAr") ?? true;
    fontCr = await pref?.getBool("fontCr") ?? true;
    fontTranslate = await pref?.getBool("fontTranslate") ?? true;
    offShow = await pref?.getBool("offShow") ?? true;

    lightMode = await pref?.getBool("lightMode") ?? true;
    sound = await pref?.getBool("sound") ?? true;

    hideIndexOfDay = await pref?.getBool("hideIndexOfDay") ?? true;
    hideIndexOfNight = await pref?.getBool("hideIndexOfNight") ?? true;

    translateText = await pref?.getBool("translateText") ?? true;
    notifications = await pref?.getBool("notifications") ?? true;
    autoStopAudio = await pref?.getBool("autoStopAudio") ?? true;

   /* locationName = await pref?.getString("locationName") ?? '';*/
    notifyListeners();
  }

  void changeFontSizeAr(int size) {
    fontSizeAr = size;
    pref?.setInt("fontSizeAr", size);
    notifyListeners();
  }

  void changeFontSizeCr(int size) {
    fontSizeCr = size;
    pref?.setInt("fontSizeCr", size);
    notifyListeners();
  }

  void changeFontSizeTr(int size) {
    fontSizeTranslate = size;
    pref?.setInt("fontSizeTranslate", size);
    notifyListeners();
  }

  void changeFontAr(bool value) {
    fontAr = value;
    pref?.setBool("fontAr", value);
    notifyListeners();
  }

  void changeFontCr(bool value) {
    fontCr = value;
    pref?.setBool("fontCr", value);
    notifyListeners();
  }

  void changeFontTr(bool value) {
    fontTranslate = value;
    pref?.setBool("fontTranslate", value);
    notifyListeners();
  }

  void changeMode(bool value) {
    lightMode = value;
    pref?.setBool("lightMode", value);
    notifyListeners();
  }

  void changeLanguageToFalse() {
    translateText = false;
    pref?.setBool("translateText", false);
    notifyListeners();
  }

  void changeLanguageToTrue() {
    translateText = true;
    pref?.setBool("translateText", true);
    notifyListeners();
  }

  void changeSound(bool value) {
    sound = value;
    pref?.setBool("sound", value);
    notifyListeners();
  }

/*  void changeNotification(bool value) async {
    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        notifications = value;
        pref?.setBool("notifications", value);
        notifyListeners();
      },
    );
  }*/

  void change(bool value) {
    offShow = value;
    pref?.setBool("offShow", false);
    notifyListeners();
  }

  void autoDayBool(bool value) {
    if(DateTime.now().hour>18){
      hideIndexOfDay = false;
      hideIndexOfNight = true;
    }
    pref?.setBool("hideIndexOfDay", true);
    pref?.setBool("hideIndexOfNight", false);
    notifyListeners();
  }

  void nightBool() {
    hideIndexOfDay = false;
    pref?.setBool("hideIndexOfDay", false);
    notifyListeners();
  }

  void dayBool() {
    hideIndexOfNight = false;
    pref?.setBool("hideIndexOfNight", false);
    notifyListeners();
  }

  void autoPlayAudio() {
    autoStopAudio = false;
    pref?.setBool("autoStopAudio", false);
    notifyListeners();
  }

  void autoplayAudio() {
    autoStopAudio = true;
    pref?.setBool("autoStopAudio", true);
    notifyListeners();
  }
/*  void locationVoid()async {
    pref?.setString("locationName", '');
    final service = LocationService();
    final locationData = await service.getLocation();

        if(locationData != null){
      final placeMark = await service.getPlaceMark(locationData: locationData);
      pref?.getString('locationName');
      locationName =
          "${(SettingsProvider.instance.translateText
              ? Translit().toTranslit(source: placeMark?.administrativeArea ?? '')
              : placeMark?.administrativeArea) ?? (SettingsProvider.instance.translateText ? 'Юкланмоқда...' : "Yuklanmoqda...")}"
          "${(SettingsProvider.instance.translateText
              ? Translit().toTranslit(source: placeMark?.country ?? '')
              : placeMark?.country) ?? ('')}";
    }
  }*/
}
