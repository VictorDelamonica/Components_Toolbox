// All rights reserved
// Monikode Mobile Solutions and Draw Your Fight
// Created by MoniK on 2024.
import 'package:flutter/material.dart';

class AutoScaleAnimatedColumn extends StatefulWidget {
  final List<Widget> items;
  final Duration? duration;
  final EdgeInsets? padding;
  final double? horizontalSpacing;
  final EdgeInsets? margin;
  final Offset? offset;
  final double? opacity;
  const AutoScaleAnimatedColumn({
    super.key,
    required this.items,
    this.duration,
    this.padding,
    this.horizontalSpacing,
    this.margin,
    this.offset,
    this.opacity,
  });

  @override
  State<AutoScaleAnimatedColumn> createState() =>
      _AutoScaleAnimatedColumnState();
}

class _AutoScaleAnimatedColumnState extends State<AutoScaleAnimatedColumn>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _slideAnimation;
  late List<Animation<double>> _opacityAnimation;

  _createAnimations() {
    _controllers = List.generate(widget.items.length, (index) {
      return AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 500),
      );
    });
    _slideAnimation = List.generate(widget.items.length, (index) {
      return Tween<Offset>(
        begin: widget.offset ?? const Offset(0, 0.2),
        end: const Offset(0, 0),
      ).animate(CurvedAnimation(
        parent: _controllers[index],
        curve: Curves.easeOut,
      ));
    });
    _opacityAnimation = List.generate(widget.items.length, (index) {
      return Tween<double>(
        begin: widget.opacity ?? 0,
        end: 1,
      ).animate(CurvedAnimation(
        parent: _controllers[index],
        curve: Curves.easeOut,
      ));
    });
  }

  _startAnimations() async {
    for (var i = 0; i < widget.items.length; i++) {
      await Future.delayed(
          widget.duration ?? const Duration(milliseconds: 500));
      _controllers[i].forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _createAnimations();
    _startAnimations();
  }

  @override
  void didUpdateWidget(AutoScaleAnimatedColumn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items.length != widget.items.length) {
      _createAnimations();
      _startAnimations();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? const EdgeInsets.all(0.0),
      margin: widget.margin ?? const EdgeInsets.all(0.0),
      child: Column(
        children: List.generate(widget.items.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: widget.horizontalSpacing ?? 16.0),
            child: FadeTransition(
              opacity: _opacityAnimation[index],
              child: SlideTransition(
                position: _slideAnimation[index],
                child: widget.items[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}
