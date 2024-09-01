// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';

/// A custom text field widget with various customization options.
class CustomTextField extends StatefulWidget {
  /// The label text to display inside the text field.
  final String label;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// The callback function to execute when the text is submitted.
  final void Function(String)? onSubmitted;

  /// Whether to obscure the text (useful for passwords).
  final bool obscureText;

  /// The border radius of the text field.
  final double borderRadius;

  /// The background color of the text field.
  final ValueNotifier<Color>? backgroundColor;

  /// The color of the text inside the text field.
  final ValueNotifier<Color>? textColor;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry edgeInsetsGeometry;

  /// Creates a `CustomTextField` widget.
  ///
  /// The [label] parameter must not be null.
  const CustomTextField(
    this.label, {
    super.key,
    this.controller,
    this.obscureText = false,
    this.borderRadius = 25,
    this.backgroundColor,
    this.onSubmitted,
    this.textColor,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.edgeInsetsGeometry = const EdgeInsets.all(0.0),
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  /// Whether the text is currently obscured.
  bool _obscureText = false;

  /// An instance of `AppDelegate` to manage app-wide settings.
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    CustomColors.colorNotifier.addListener(_updateColors);
  }

  @override
  void dispose() {
    CustomColors.colorNotifier.removeListener(_updateColors);
    super.dispose();
  }

  /// Updates the state when `CustomColors` changes.
  void _updateColors() {
    setState(() {});
  }

  /// Toggles the obscure text state.
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Appearance>(
      valueListenable: _appDelegate.appearanceNotifier,
      builder: (context, appearance, child) {
        return Padding(
          padding: widget.edgeInsetsGeometry,
          child: TextField(
            controller: widget.controller,
            obscureText: _obscureText,
            onSubmitted: widget.onSubmitted,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization,
            style: TextStyle(
              color: widget.textColor?.value ?? _appDelegate.getColor("Text"),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.backgroundColor?.value ??
                  _appDelegate.getColor("Light"),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              labelText: widget.label,
              labelStyle: TextStyle(
                color: _appDelegate.getColor("InvertedDark"),
              ),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: _appDelegate.getColor("InvertedDark"),
                      ),
                      onPressed: _toggleObscureText,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
