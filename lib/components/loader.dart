import 'dart:async';

import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final ValueListenable<bool> value;
  final Widget page;
  final Color? color;
  final int milliseconds;
  final Curve curve;
  final IconData? icon;
  final double? iconSize;
  final String? imagePath;
  final double? imageSize;
  const Loader({
    super.key,
    required this.value,
    required this.page,
    this.color,
    this.milliseconds = 500,
    this.curve = Curves.easeInOut,
    this.icon,
    this.iconSize,
    this.imagePath,
    this.imageSize,
  });

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  late double _height = 200.0;
  late double _width = 200.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.milliseconds),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _rotationAnimation = CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    );
    if (widget.imagePath != null) {
      _height = widget.imageSize!;
      _width = widget.imageSize!;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            _height = _height == widget.imageSize
                ? widget.imageSize! * 1.2
                : widget.imageSize!;
            _width = _width == widget.imageSize
                ? widget.imageSize! * 1.2
                : widget.imageSize!;
          });
        } else {
          timer.cancel();
        }
      });
    }
    widget.value.addListener(_handleValueChange);
  }

  void _handleValueChange() {
    if (widget.value.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _rotationController.dispose();
    widget.value.removeListener(_handleValueChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeTransition(
          opacity: _animation,
          child: widget.page,
        ),
        FadeTransition(
          opacity: ReverseAnimation(_animation),
          child: Center(
            child: widget.icon != null
                ? RotationTransition(
                    turns: _rotationAnimation,
                    child: Icon(widget.icon,
                        size: widget.iconSize ?? 60,
                        color: widget.color ??
                            AppDelegate.getInstance().getColor("Dark")),
                  )
                : widget.imagePath != null
                    ? AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: _height,
                        width: _width,
                        child: Image.asset(
                          widget.imagePath!,
                          width: widget.imageSize,
                        ),
                      )
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            widget.color ??
                                AppDelegate.getInstance().getColor("Dark")),
                      ),
          ),
        ),
      ],
    );
  }
}
