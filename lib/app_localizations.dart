import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yaml/yaml.dart';

class AppLocalizations {
  final String localeName;

  AppLocalizations(this.localeName);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  YamlMap translations;

  Future load() async {
    String fileString = await rootBundle.loadString('lang/$localeName.yaml');
    translations = loadYaml(fileString);
  }

  String translate(String key) {
    try {
      var keys = key.split('.');
      dynamic translated = translations;
      keys.forEach((element) => translated = translated[element]);

      if (translated == null) return 'Key not found: $key';
      return translated;
    } catch (e) {
      return 'Key not found: $key';
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    var translations = AppLocalizations(locale.languageCode);
    await translations.load();
    return translations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
