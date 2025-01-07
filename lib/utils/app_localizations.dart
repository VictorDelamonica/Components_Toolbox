// All rights reserved
// Monikode Mobile Solutions and Draw Your Fight
// Created by MoniK on 2024.
import 'dart:convert';

import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale? locale;

  AppLocalizations({
    this.locale,
  });

  // A static method to obtain an instance of AppLocalizations in the context
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // A LocalizationsDelegate for this localization class
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // A map to store the localized strings
  late Map<String, String> _localizedStrings;

  // Method to load localized strings from JSON files
  Future loadJsonLanguage() async {
    String jsonString =
        await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");

    // Parse the JSON string into a map
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    // Convert the map values to strings and store them in the _localizedStrings map
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  // Method to translate a key into a localized string
  String translate(String key) => _localizedStrings[key] ?? "";

  // Method to translate a key with dynamic arguments
  String translateWithArgs(String key, Map<String, dynamic> args) {
    String translation = _localizedStrings[key] ?? "";

    // Replace placeholders in the translation string with actual values from args
    args.forEach((key, value) {
      translation = translation.replaceAll("{$key}", value.toString());
    });

    return translation;
  }

  static Future<List<String>> getAllFilesAsString() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final assetPaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/lang'))
        .toList();

    List<String> filePaths = [];

    for (var path in assetPaths) {
      filePaths.add(path);
    }

    return filePaths;
  }

  static Future<List<String>> getSupportedLocales(
      List<String> supportedLocales) async {
    var value = await getAllFilesAsString();
    for (var element in value) {
      supportedLocales.add(element.split("/").last.split(".")[0]);
    }
    return supportedLocales;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppDelegate.getInstance()
        .localesString
        .value
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // Check if the locale is supported
    if (!isSupported(locale)) {
      // If not supported, set the locale to 'en'
      locale = Locale(AppDelegate.getInstance().defaultLocale.value);
    }

    // Create an instance of AppLocalizations and load the appropriate JSON file
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

extension TranslateWhoutArgs on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}

extension TranslateWithArg on String {
  String trWithArg(BuildContext context, Map<String, dynamic> args) {
    return AppLocalizations.of(context)!.translateWithArgs(this, args);
  }
}
