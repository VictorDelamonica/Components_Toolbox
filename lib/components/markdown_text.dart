// All rights reserved
// Monikode Mobile Solutions and Draw Your Fight
// Created by MoniK on 2024.
import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:flutter/material.dart';

class MarkdownText extends StatefulWidget {
  final List<String> paragraphs;
  final double fontSize;

  const MarkdownText(
      {super.key, required this.paragraphs, this.fontSize = 16.0});

  @override
  State<MarkdownText> createState() => _MarkdownTextState();
}

class _MarkdownTextState extends State<MarkdownText> {
  List<TextSpan> spans = [];
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  Future<void> _buildSpans() async {
    List<String> parts = widget.paragraphs.join("\n\n").split("**");
    spans = [];
    for (var i = 0; i < parts.length; i++) {
      spans.add(
        TextSpan(
          text: parts[i],
          style: TextStyle(
            color: _appDelegate.getColor("Text"),
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
                    color: _appDelegate.getColor("Text"),
                    textBaseline: TextBaseline.alphabetic)),
          );
        });
  }
}
