// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'dart:async';

import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';

/// A widget that displays a carousel of images with a preview and page indicator.
class Carousel extends StatefulWidget {
  /// A list of maps containing image data.
  final List<Map> images;

  /// The height of the main carousel.
  final double mainHeight;

  /// The height of the preview carousel.
  final double previewHeight;

  /// The background color of the carousel.
  final Color? backgroundColor;

  /// The color of the current page indicator.
  final Color? currentPageIndicatorColor;

  /// The radius of the main carousel corners.
  final double radius;

  /// The radius of the preview carousel corners.
  final double previewRadius;

  /// The radius of the current page indicator corners.
  final double currentPageIndicatorRadius;

  /// The padding inside the main carousel.
  final double padding;

  /// The padding inside the preview carousel.
  final double previewPadding;

  /// The padding inside the current page indicator.
  final double currentPageIndicatorPadding;

  /// The duration of the page transition in seconds.
  final int? duration;

  /// The curve of the page transition animation.
  final Curve? curve;

  /// A widget that displays a carousel of images with a preview and page indicator.
  const Carousel({
    super.key,
    required this.images,
    this.backgroundColor,
    this.currentPageIndicatorColor,
    this.mainHeight = 400.0,
    this.previewHeight = 60.0,
    this.radius = 16,
    this.previewRadius = 16,
    this.padding = 8,
    this.previewPadding = 8,
    this.currentPageIndicatorRadius = 2.0,
    this.currentPageIndicatorPadding = 1,
    this.duration,
    this.curve,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _controller;
  List<String> picture = List.empty(growable: true);
  List<String> text = List.empty(growable: true);
  Timer? _timer;
  final AppDelegate _appDelegate = AppDelegate.getInstance();
  int duration = 5;

  /// Sets the images and text from the provided list of maps.
  void setImages() {
    for (var item in widget.images) {
      var values = item.values;
      picture.add(values.first as String);
      text.add(values.last as String);
    }
  }

  @override
  void initState() {
    super.initState();
    duration = widget.duration ?? 5;
    setImages();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller = AnimationController(vsync: this);
      _timer = Timer.periodic(Duration(seconds: duration), (Timer timer) {
        if (!_pageController.hasClients) return;
        if (_pageController.page?.round() == widget.images.length - 1) {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 800),
            curve: widget.curve ?? Curves.easeInOut,
          );
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 800),
            curve: widget.curve ?? Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _appDelegate.appearanceNotifier,
        builder: (context, _, __) {
          return Column(
            children: [
              // Main carousel container
              RoundedContainer(
                color: widget.backgroundColor ?? _appDelegate.getColor("Light"),
                height: widget.mainHeight,
                padding: widget.padding,
                radius: widget.radius,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Image.asset(
                          picture[index],
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(height: 10),
                        AutoText(
                          text[index],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Preview carousel container
              RoundedContainer(
                height: widget.previewHeight,
                color: widget.backgroundColor ?? _appDelegate.getColor("Light"),
                padding: widget.previewPadding,
                radius: widget.previewRadius,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.images.length,
                      (index) => AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          return GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: RoundedContainer(
                              padding: widget.currentPageIndicatorPadding,
                              radius: widget.currentPageIndicatorRadius,
                              color: _pageController.page == index
                                  ? widget.currentPageIndicatorColor ??
                                      _appDelegate.getColor("InvertedDark")
                                  : widget.backgroundColor ??
                                      _appDelegate.getColor("Light"),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset(
                                    picture[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
