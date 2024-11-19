// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:flutter/material.dart';

/// A widget that displays a column of children with customizable spacing.
///
/// The [SpacedColumn] widget allows you to display a column of widgets with
/// a specified spacing between each child. It also supports various alignment
/// options for the main axis, cross axis, and text direction.
class SpacedColumn extends StatefulWidget {
  /// The list of widgets to be displayed in the column.
  final List<Widget> children;

  /// The spacing between each child widget.
  final double? spacing;

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

  /// A widget that displays a column of children with customizable vertical spacing.
  ///
  /// The [SpacedColumn] widget allows you to display a column of widgets with
  /// a specified spacing between each child. It also supports various alignment
  /// options for the main axis, cross axis, and text direction.
  const SpacedColumn({
    super.key,
    required this.children,
    this.spacing,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  });

  @override
  State<SpacedColumn> createState() => _SpacedColumnState();
}

class _SpacedColumnState extends State<SpacedColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: widget.mainAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      crossAxisAlignment: widget.crossAxisAlignment,
      textDirection: widget.textDirection,
      verticalDirection: widget.verticalDirection,
      textBaseline: widget.textBaseline,
      children: [
        for (var i = 0; i < widget.children.length; i++) ...{
          widget.children[i],
          i == widget.children.length - 1
              ? const SizedBox(
                  height: 0,
                )
              : SizedBox(
                  height: widget.spacing ?? 16,
                ),
        }
      ],
    );
  }
}
