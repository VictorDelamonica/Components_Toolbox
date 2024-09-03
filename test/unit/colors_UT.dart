// All rights reserved
// Monikode Mobile Solutions and Draw Your Fight
// Created by MoniK on 2024.
import 'package:components_toolbox/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Get the color", () {
    final color = CustomColors.appBar;
    expect(color, isNotNull);
    expect(color, isA<Color>());
  });

  test("Get the dark color", () {
    final color = CustomColors.appBarDark;
    expect(color, isNotNull);
    expect(color, isA<Color>());
  });

  test("Set color", () {
    const color = Colors.red;
    CustomColors.setColor(CustomColor.appBar, color);
    expect(CustomColors.appBar, isNotNull);
    expect(color, isA<Color>());
    expect(CustomColors.appBar, color);
  });

  test("Reset Colors", () {
    CustomColors.resetColors();
    expect(CustomColors.appBar, isNotNull);
    expect(CustomColors.appBar, isA<Color>());
    expect(CustomColors.appBar, CustomColors.appBar);
  });
}
