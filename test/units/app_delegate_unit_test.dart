// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:components_toolbox/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  test(
    'Get the instance of the AppDelegate',
    () => {
      expect(AppDelegate.getInstance(), isNotNull),
    },
  );
  test(
    'Get the appearance',
    () => {
      expect(AppDelegate.getInstance().getAppearance(), Appearance.light),
    },
  );

  test("Is light", () => {expect(AppDelegate.getInstance().isLight(), true)});

  test('Set an appearance', () {
    const appearance = Appearance.dark;
    AppDelegate.getInstance().setAppearance(appearance);
    expect(AppDelegate.getInstance().appearanceNotifier.value, appearance);
  });

  test("Reset appearance", () {
    AppDelegate.getInstance().resetAppearance();
    expect(
        AppDelegate.getInstance().appearanceNotifier.value, Appearance.light);
  });

  test("Switch appearance", () {
    AppDelegate.getInstance().switchAppearance();
    expect(AppDelegate.getInstance().appearanceNotifier.value, Appearance.dark);
  });

  test("Get color", () {
    AppDelegate.getInstance().resetAppearance();
    final color = AppDelegate.getInstance().getColor("AppBar");
    expect(color, isNotNull);
    expect(color, isA<Color>());
    expect(color, CustomColors.appBar);
  });

  test("Get color dark", () {
    AppDelegate.getInstance().setAppearance(Appearance.dark);
    final color = AppDelegate.getInstance().getColor("AppBar");
    expect(color, isNotNull);
    expect(color, isA<Color>());
    expect(color, CustomColors.appBarDark);
  });
}
