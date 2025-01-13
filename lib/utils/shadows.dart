// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:flutter/material.dart';

/// A class that provides custom shadow styles for widgets.
class CustomShadows {
  /// A regular shadow style.
  static ValueNotifier<BoxShadow> regular = ValueNotifier(_buildShadow());

  /// A regular shadow style with centered offset.
  static ValueNotifier<BoxShadow> regularCentered =
      ValueNotifier(_buildShadow(offset: const Offset(0, 0)));

  /// A larger shadow style with centered offset.
  static ValueNotifier<BoxShadow> bigCentered =
      ValueNotifier(_buildShadow(blurRadius: 15, offset: const Offset(0, 0)));

  /// A lighter shadow style.
  static ValueNotifier<BoxShadow> light =
      ValueNotifier(_buildShadow(opacity: 0.1));

  /// Builds a `BoxShadow` with the given properties.
  ///
  /// [opacity] The opacity of the shadow color.
  /// [blurRadius] The blur radius of the shadow.
  /// [offset] The offset of the shadow.
  /// Returns a `BoxShadow` with the specified properties.
  static BoxShadow _buildShadow(
      {double opacity = 0.25,
      double blurRadius = 4,
      Offset offset = const Offset(2, 4)}) {
    final AppDelegate appDelegate = AppDelegate.getInstance();
    return BoxShadow(
      // ignore: deprecated_member_use
      color: appDelegate.getColor("Text").withOpacity(opacity),
      blurRadius: blurRadius,
      offset: offset,
    );
  }

  /// Updates the shadow styles to reflect any changes in appearance settings.
  static void updateShadows() {
    regular.value = _buildShadow();
    regularCentered.value = _buildShadow(offset: const Offset(0, 0));
    bigCentered.value =
        _buildShadow(blurRadius: 15, offset: const Offset(0, 0));
    light.value = _buildShadow(opacity: 0.1);
  }
}
