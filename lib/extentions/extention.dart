import '../settings/Translate.dart';

extension StringExtension on String{
  String toLatin(bool isLatin){
    if(isLatin){
      return Translate.toLatin(this);
    }else{
      return this;
    }
  }

  String toCyrilic (bool isCyrilic){
    if(isCyrilic){
      return Translate.toCyrilic(this);
    }else{
      return this;
    }
  }
}
