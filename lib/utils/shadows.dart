import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:flutter/material.dart';

class CustomShadows {
  static ValueNotifier<BoxShadow> regular = ValueNotifier(_buildShadow());
  static ValueNotifier<BoxShadow> regularCentered =
      ValueNotifier(_buildShadow(offset: const Offset(0, 0)));
  static ValueNotifier<BoxShadow> bigCentered =
      ValueNotifier(_buildShadow(blurRadius: 15, offset: const Offset(0, 0)));
  static ValueNotifier<BoxShadow> light =
      ValueNotifier(_buildShadow(opacity: 0.1));

  static BoxShadow _buildShadow(
      {double opacity = 0.25,
      double blurRadius = 4,
      Offset offset = const Offset(0, 4)}) {
    final AppDelegate appDelegate = AppDelegate.getInstance();
    return BoxShadow(
      color: appDelegate.getColor("Text").withOpacity(opacity),
      blurRadius: blurRadius,
      offset: offset,
    );
  }

  static void updateShadows() {
    regular.value = _buildShadow();
    regularCentered.value = _buildShadow(offset: const Offset(0, 0));
    bigCentered.value =
        _buildShadow(blurRadius: 15, offset: const Offset(0, 0));
    light.value = _buildShadow(opacity: 0.1);
  }
}
