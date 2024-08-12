import 'package:components_toolbox/utils/app_delegate.dart';
import 'package:components_toolbox/utils/shadows.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatefulWidget {
  final Widget child;
  final int? height;
  final int? width;
  final double radius;
  final Color? color;
  final double padding;
  final double margin;
  final ValueNotifier<BoxShadow>? shadow;
  final Border? border;

  const RoundedContainer({
    super.key,
    required this.child,
    this.radius = 16,
    this.padding = 8,
    this.margin = 0,
    this.height,
    this.width,
    this.color,
    this.shadow,
    this.border,
  });

  @override
  State<RoundedContainer> createState() => _RoundedContainerState();
}

class _RoundedContainerState extends State<RoundedContainer> {
  final AppDelegate _appDelegate = AppDelegate.getInstance();

  @override
  void initState() {
    super.initState();
    _appDelegate.appearanceNotifier.addListener(_updateShadows);
  }

  @override
  void dispose() {
    _appDelegate.appearanceNotifier.removeListener(_updateShadows);
    super.dispose();
  }

  void _updateShadows() {
    CustomShadows.updateShadows();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<BoxShadow>(
      valueListenable: widget.shadow ?? CustomShadows.regular,
      builder: (context, shadow, child) {
        return Container(
          height: widget.height?.toDouble(),
          width: widget.width?.toDouble(),
          padding: EdgeInsets.all(widget.padding),
          margin: EdgeInsets.all(widget.margin),
          decoration: BoxDecoration(
            color: widget.color ?? _appDelegate.getColor("Background"),
            borderRadius: BorderRadius.circular(widget.radius),
            boxShadow: widget.shadow != null ? [shadow] : null,
            border: widget.border ?? Border.all(color: Colors.transparent),
          ),
          child: widget.child,
        );
      },
    );
  }
}
