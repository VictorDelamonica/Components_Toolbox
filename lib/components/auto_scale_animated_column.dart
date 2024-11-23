// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:flutter/material.dart';

/// A widget that displays a column of items with animations for slide and fade effects.
///
/// The [AutoScaleAnimatedColumn] widget animates its children with a slide and fade effect.
/// The animations are controlled by [AnimationController]s and can be customized with various parameters.
class AutoScaleAnimatedColumn extends StatefulWidget {
  /// The list of widgets to be displayed in the column.
  final List<Widget> items;

  /// The duration of the animations.
  final Duration? duration;

  /// The padding around the column.
  final EdgeInsets? padding;

  /// The vertical spacing between the items.
  final double? verticalSpacing;

  /// The margin around the column.
  final EdgeInsets? margin;

  /// The offset for the slide animation.
  final Offset? offset;

  /// The initial opacity for the fade animation.
  final double? opacity;

  /// How the children should be placed along the main axis.
  final MainAxisAlignment mainAxisAlignment;

  /// How much space should be occupied in the main axis.
  final MainAxisSize mainAxisSize;

  /// How the children should be placed along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  /// The text direction for the column.
  final TextDirection? textDirection;

  /// The vertical direction for the column.
  final VerticalDirection verticalDirection;

  /// The text baseline for aligning text.
  final TextBaseline? textBaseline;

  /// A widget that displays a column of items with animations for slide and fade effects.
  ///
  /// The [AutoScaleAnimatedColumn] widget animates its children with a slide and fade effect.
  /// The animations are controlled by [AnimationController]s and can be customized with various parameters.
  const AutoScaleAnimatedColumn({
    super.key,
    required this.items,
    this.duration,
    this.padding,
    this.verticalSpacing,
    this.margin,
    this.offset,
    this.opacity,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
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

  /// Creates the animations for the slide and fade effects.
  void _createAnimations() {
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

  /// Starts the animations sequentially with a delay.
  Future<void> _startAnimations() async {
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
        mainAxisAlignment: widget.mainAxisAlignment,
        mainAxisSize: widget.mainAxisSize,
        crossAxisAlignment: widget.crossAxisAlignment,
        textDirection: widget.textDirection,
        verticalDirection: widget.verticalDirection,
        textBaseline: widget.textBaseline,
        children: List.generate(widget.items.length, (index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(vertical: widget.verticalSpacing ?? 16.0),
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
