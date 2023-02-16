part of 'theming_cubit.dart';

@immutable
abstract class ThemingState {}

class ThemingInitial extends ThemingState {}

class ThemingChanged extends ThemingState {}

class LanguageChanged extends ThemingState {}
