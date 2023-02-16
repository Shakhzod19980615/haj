import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theming_state.dart';

class ThemingCubit extends Cubit<ThemingState> {
  ThemingCubit() : super(ThemingInitial());

  bool _isLatin = false;
  bool get isLatin => _isLatin;

  bool _isDark = false;
  bool get isDark => _isDark;

  SharedPreferences? _prefs;

  void getLang() async{
    _prefs ??= await SharedPreferences.getInstance();
    _isLatin = _prefs?.getBool("lang")??false;
    emit(LanguageChanged());
  }

  void saveLang() async{
    _prefs ??= await SharedPreferences.getInstance();
    _prefs?.setBool("lang", isLatin);
    _prefs?.commit();
  }

  void changeLanguage() {
    _isLatin = !_isLatin;
    saveLang();
    emit(LanguageChanged());
  }



  void init()async{
     _prefs ??= await SharedPreferences.getInstance();
    _isDark = _prefs?.getBool("theme")??false;
    emit(ThemingChanged());
  }
  void saveTheme()async{
    _prefs ??= await SharedPreferences.getInstance();
    _prefs?.setBool("theme", isDark);
    _prefs?.commit();
  }
  void changeTheme() {
    _isDark = !_isDark;
    saveTheme();
    emit(ThemingChanged());
  }
}