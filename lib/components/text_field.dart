import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final bool obscureText;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomTextFiled(
    this.label,
    this.controller, {
    super.key,
    this.obscureText = false,
    this.borderRadius = 25,
    this.backgroundColor,
    this.onSubmitted,
    this.textColor,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool _obscureText = false;
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

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
        return TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          onSubmitted: widget.onSubmitted,
          style: TextStyle(
            color: widget.textColor ?? _appDelegate.getColor("Text"),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor:
                widget.backgroundColor ?? _appDelegate.getColor("Background"),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius)),
            ),
            labelText: widget.label,
            labelStyle: TextStyle(
              color: _appDelegate.getColor("Dark"),
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: _appDelegate.getColor("Dark"),
                    ),
                    onPressed: _toggleObscureText,
                  )
                : null,
          ),
        );
      },
    );
  }
}
