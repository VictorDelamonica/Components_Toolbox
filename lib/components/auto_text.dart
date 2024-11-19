// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:flutter/material.dart';

/// A widget that displays text with customizable style and alignment.
///
/// The [AutoText] widget allows you to display text with various styling options
/// such as font size, font family, font weight, and text color. It also supports
/// text alignment, maximum number of lines, and overflow handling.
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

  /// The weight of the font.
  final FontWeight? fontWeight;

  /// The color to use when painting the text.
  final Color? textColor;

  /// A widget that displays text with customizable style and alignment.
  ///
  /// The [AutoText] widget allows you to display text with various styling options
  /// such as [fontSize], [fontFamily], [fontWeight], and [textColor]. It also supports
  /// [textAlign], [maxLines], and [overflow] handling.
  const AutoText(this.text,
      {super.key,
      this.style,
      this.textAlign = TextAlign.start,
      this.maxLines = 100,
      this.overflow = TextOverflow.ellipsis,
      this.fontSize = 16,
      this.fontFamily = "Roboto",
      this.fontWeight = FontWeight.normal,
      this.textColor});

  @override
  State<AutoText> createState() => _AutoTextState();
}

class _AutoTextState extends State<AutoText> {
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  @override
  void initState() {
    _appDelegate.appearanceNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

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
                fontWeight: widget.fontWeight,
              ),
          textAlign: widget.textAlign,
          maxLines: widget.maxLines,
          overflow: widget.overflow,
        );
      },
    );
  }
}
