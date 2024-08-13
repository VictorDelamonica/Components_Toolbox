import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:flutter/material.dart';

class AutoText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final double fontSize;
  final Color? textColor;

  const AutoText(this.text,
      {super.key,
      this.style,
      this.textAlign = TextAlign.start,
      this.maxLines = 1,
      this.overflow = TextOverflow.ellipsis,
      this.fontSize = 16,
      this.textColor});

  @override
  State<AutoText> createState() => _AutoTextState();
}

class _AutoTextState extends State<AutoText> {
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
                  fontSize: widget.fontSize),
          textAlign: widget.textAlign,
          maxLines: widget.maxLines,
          overflow: widget.overflow,
        );
      },
    );
  }
}
