// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:flutter/material.dart';

/// A widget that displays text with customizable style and appearance.
///
/// The `AutoText` widget listens to changes in the app's appearance and updates
/// the text style accordingly.
class AutoText extends StatefulWidget {
  /// The text to display.
  final String text;

  /// The style to apply to the text.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The maximum number of lines for the text to span.
  final int maxLines;

  /// How visual overflow should be handled.
  final TextOverflow overflow;

  /// The font size of the text.
  final double? fontSize;

  /// The font family to use when painting the text.
  final String fontFamily;

  /// The color to use when painting the text.
  final Color? textColor;

  /// Creates an `AutoText` widget.
  ///
  /// The [text] parameter must not be null.
  const AutoText(this.text,
      {super.key,
      this.style,
      this.textAlign = TextAlign.start,
      this.maxLines = 100,
      this.overflow = TextOverflow.ellipsis,
      this.fontSize = 16,
      this.fontFamily = "Roboto",
      this.textColor});

  @override
  State<AutoText> createState() => _AutoTextState();
}

class _AutoTextState extends State<AutoText> {
  /// An instance of `AppDelegate` to manage app-wide settings.
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Appearance>(
      valueListenable: _appDelegate.appearanceNotifier,
      builder: (context, appearance, child) {
        return Text(
          widget.text,
          style: widget.style ??
              TextStyle(
                color: widget.textColor ?? _appDelegate.getColor("Text"),
                fontSize: widget.fontSize,
                fontFamily: widget.fontFamily,
              ),
          textAlign: widget.textAlign,
          maxLines: widget.maxLines,
          overflow: widget.overflow,
        );
      },
    );
  }
}
