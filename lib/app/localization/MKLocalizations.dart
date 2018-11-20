import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mt_ik_sunyata/app/style/MKBase.dart';
import 'package:mt_ik_sunyata/app/style/MKEn.dart';
import 'package:mt_ik_sunyata/app/style/MKZh.dart';

///自定义多语言实现
class MKLocalizations {
  final Locale locale;

  MKLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  static Map<String, MKBase> _localizedValues = {
    'en': new MKEn(),
    'zh': new MKZh(),
  };

  MKBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 MKLocalizations
  ///获取对应的 MKBase
  static MKLocalizations of(BuildContext context) {
    print(Localizations);
    print(MKLocalizations);
    return Localizations.of(context, MKLocalizations);
  }
}
