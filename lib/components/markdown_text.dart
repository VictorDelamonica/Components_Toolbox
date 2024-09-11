// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:flutter/material.dart';

/// A widget that displays a list of paragraphs with markdown-like bold text.
///
/// The `MarkdownText` widget takes a list of paragraphs and displays them
/// with bold text for any text enclosed in double asterisks (**).
class MarkdownText extends StatefulWidget {
  /// The list of paragraphs to display.
  final List<String> paragraphs;

  /// The font size of the text.
  final double fontSize;

  /// The font family to use when painting the text.
  final String fontFamily;

  /// Creates a [MarkdownText] widget.
  ///
  /// The [paragraphs] parameter must not be null.
  /// The [fontSize] parameter defaults to 16.0 if not provided.
  const MarkdownText({
    super.key,
    required this.paragraphs,
    this.fontSize = 16.0,
    this.fontFamily = "Roboto",
  });

  @override
  State<MarkdownText> createState() => _MarkdownTextState();
}

class _MarkdownTextState extends State<MarkdownText> {
  /// The list of text spans to display.
  List<TextSpan> spans = [];

  /// The instance of [AppDelegate] to get colors.
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  /// Builds the list of text spans from the paragraphs.
  ///
  /// This method splits the paragraphs by double asterisks (**) and creates
  /// text spans with normal or bold font weight based on the position of the
  /// text parts.
  Future<void> _buildSpans() async {
    List<String> parts = widget.paragraphs.join("\n\n").split("**");
    spans = [];
    for (var i = 0; i < parts.length; i++) {
      spans.add(
        TextSpan(
          text: parts[i],
          style: TextStyle(
            color: _appDelegate.getColor("Text"),
            fontFamily: widget.fontFamily,
            fontSize: widget.fontSize,
            fontWeight: i % 2 == 0 ? FontWeight.normal : FontWeight.bold,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _buildSpans();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _appDelegate.appearanceNotifier,
      builder: (context, value, child) {
        _buildSpans();
        return RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: spans,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: widget.fontFamily,
              color: _appDelegate.getColor("Text"),
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        );
      },
    );
  }
}
