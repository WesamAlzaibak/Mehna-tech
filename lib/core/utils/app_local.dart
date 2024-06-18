import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocale {

  Locale? locale ;

  Map<String , String>? loadedLocalizedValues ;
  AppLocale(this.locale) ;

  static AppLocale of (BuildContext context) {
    return Localizations.of(context, AppLocale) ;
  }

  Future loadLang() async {
    String  langFile = await rootBundle.loadString('assets/lang/${locale?.languageCode}.json') ;
    Map<String ,dynamic> loadedValues = jsonDecode(langFile);
    loadedLocalizedValues = loadedValues.map((key, value) => MapEntry(key, value.toString())) ;
  }

  String getTranslated(String key) {
    if (loadedLocalizedValues != null && loadedLocalizedValues!.containsKey(key)) {
      return loadedLocalizedValues![key]!;
    } else {
      return 'Key not found: $key';
    }
  }

  static const LocalizationsDelegate<AppLocale> delegate  = _AppLocalDelegate() ;

}


class  _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocalDelegate() ;
  @override
  bool isSupported(Locale locale) {
    return ["en" , "ar"].contains(locale.languageCode) ;
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale) ;
    await appLocale.loadLang();
    return appLocale ;
  }

  @override
  bool shouldReload(_AppLocalDelegate  old) => false  ;

}


getLang(BuildContext context  , String key) {
  return AppLocale.of(context).getTranslated(key) ;
}