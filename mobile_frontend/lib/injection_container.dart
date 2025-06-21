import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/bloc_observer.dart';
import 'features/base/presentation/bloc/base_bloc.dart';

final sl = GetIt.instance;

// define main variables

var languageCode = "en";
String fcmToken = "";
var locale;
var isOnboarding = "No data found!";
var selectedLanguageValue;
bool? isLight;

String? sessionId;
String? mobile;
String? firstName;
String? lastName;
String? gender;
String? userCity;
String? userDateOfBirth;
String? userProfilePhoto;
String? pushNotifications;


Future<void> initializeDependencies() async {

  // Bloc Observer

  Bloc.observer = MyBlocObserver();

  if (languageCode == 'No data found!') {
    String languageSystem = '';
    languageSystem = Platform.localeName.split('_')[0];
    locale = Locale(languageSystem);
    languageCode = languageSystem;
    if (languageCode == "en") {
      selectedLanguageValue = 1;
    } else {
      selectedLanguageValue = 2;
    }
  } else if (languageCode == 'en') {
    locale = const Locale('en');
    selectedLanguageValue = 1;
  } else {
    locale = const Locale('ar');
    selectedLanguageValue = 2;
  }
  sl.registerFactory<BaseBloc>(() => BaseBloc());
}
