import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final ValueListenable<bool> value;
  final Widget page;
  final Color? color;
  const Loader(
      {super.key, required this.value, required this.page, this.color});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
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
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  widget.color ?? AppDelegate.getInstance().getColor("Dark")),
            ),
          ),
        ),
      ],
    );
  }
}
