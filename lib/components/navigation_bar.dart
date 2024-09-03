// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.

import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';

/// Enum representing different styles for the navigation bar.
enum NavigationBarStyle {
  classic,
  icons,
  texts,
  images,
}

/// A custom navigation bar widget that supports different styles.
class CustomNavigationBar extends StatefulWidget {
  /// The style of the navigation bar.
  final NavigationBarStyle style;

  /// The list of pages to display.
  final List<Widget> pages;

  /// The current index of the selected page.
  final ValueNotifier<int> currentIndex;

  /// The list of icons for the navigation items (optional).
  final List<IconData>? icons;

  /// The list of labels for the navigation items (optional).
  final List<String>? labels;

  /// The list of colors for the selected items (optional).
  final List<Color>? selectedColors;

  /// The color for unselected items (optional).
  final Color? unselectedColors;

  /// The background color of the navigation bar (optional).
  final Color? backgroundColor;

  /// Creates a [CustomNavigationBar] widget.
  ///
  /// The [pages] and [currentIndex] parameters are required.
  const CustomNavigationBar({
    super.key,
    this.style = NavigationBarStyle.classic,
    required this.pages,
    this.icons,
    this.labels,
    this.selectedColors,
    required this.currentIndex,
    this.unselectedColors,
    this.backgroundColor,
  }) : assert(pages.length > 1 &&
            (style == NavigationBarStyle.classic
                ? icons != null && labels != null
                : (style == NavigationBarStyle.icons
                    ? icons != null
                    : (style == NavigationBarStyle.texts
                        ? labels != null
                        : (style == NavigationBarStyle.images
                            ? selectedColors != null &&
                                unselectedColors != null &&
                                icons != null &&
                                labels != null
                            : false)))));

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    switch (widget.style) {
      case NavigationBarStyle.classic:
        return BottomNavigationBar(
          backgroundColor: widget.backgroundColor ??
              AppDelegate.getInstance().getColor("Background"),
          items: List.generate(
            widget.pages.length,
            (index) => BottomNavigationBarItem(
              icon: Icon(widget.icons![index]),
              label: widget.labels![index],
            ),
          ),
          onTap: (index) {
            setState(() {
              widget.currentIndex.value = index;
            });
          },
          currentIndex: widget.currentIndex.value,
          selectedItemColor: widget.selectedColors != null
              ? widget.selectedColors![widget.currentIndex.value]
              : Theme.of(context).primaryColor,
          unselectedItemColor: widget.unselectedColors ?? Colors.grey,
        );
      case NavigationBarStyle.icons:
        return BottomNavigationBar(
          backgroundColor: widget.backgroundColor ??
              AppDelegate.getInstance().getColor("Background"),
          items: List.generate(
            widget.pages.length,
            (index) => BottomNavigationBarItem(
              icon: Icon(widget.icons![index]),
              label: '',
            ),
          ),
          onTap: (index) {
            setState(() {
              widget.currentIndex.value = index;
            });
          },
          currentIndex: widget.currentIndex.value,
          selectedItemColor: widget.selectedColors != null
              ? widget.selectedColors![widget.currentIndex.value]
              : Theme.of(context).primaryColor,
          unselectedItemColor: widget.unselectedColors ?? Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        );
      case NavigationBarStyle.texts:
        return BottomNavigationBar(
          backgroundColor: widget.backgroundColor ??
              AppDelegate.getInstance().getColor("Background"),
          items: List.generate(
            widget.pages.length,
            (index) => BottomNavigationBarItem(
              icon: const Icon(Icons.circle),
              label: widget.labels![index],
            ),
          ),
          onTap: (index) {
            setState(() {
              widget.currentIndex.value = index;
            });
          },
          iconSize: 0,
          currentIndex: widget.currentIndex.value,
          selectedItemColor: widget.selectedColors != null
              ? widget.selectedColors![widget.currentIndex.value]
              : Theme.of(context).primaryColor,
          unselectedItemColor: widget.unselectedColors ?? Colors.grey,
        );
      default:
        return Container();
    }
  }
}

/// A floating bottom navigation bar widget that supports different styles.
class FloatingBottomNavigationBar extends StatefulWidget {
  /// The list of pages to display.
  final List<Widget> pages;

  /// The current index of the selected page.
  final ValueNotifier<int> currentPage;

  /// The style of the navigation bar.
  final NavigationBarStyle style;

  /// The height of the navigation bar (optional).
  final double? height;

  /// The list of colors for the navigation items (optional).
  final List<Color>? color;

  /// The list of labels for the navigation items (optional).
  final List<String>? labels;

  /// The list of icons for the navigation items (optional).
  final List<IconData>? icons;

  /// The list of images when the page is displayed for the navigation items (optional).
  final List<IconData>? selectedIcons;

  /// Whether to display an app bar (optional).
  final bool withAppBar;

  /// Creates a [FloatingBottomNavigationBar] widget.
  ///
  /// The [pages] and [currentPage] parameters are required.
  const FloatingBottomNavigationBar({
    super.key,
    this.style = NavigationBarStyle.classic,
    this.height = 90,
    required this.pages,
    required this.currentPage,
    this.color,
    this.labels,
    this.icons,
    this.withAppBar = true,
    this.selectedIcons,
  }) : assert(pages.length > 1 &&
            (style == NavigationBarStyle.classic
                ? icons != null && labels != null
                : (style == NavigationBarStyle.icons
                    ? icons != null
                    : (style == NavigationBarStyle.texts
                        ? labels != null
                        : false))));

  @override
  State<FloatingBottomNavigationBar> createState() =>
      _FloatingBottomNavigationBarState();
}

class _FloatingBottomNavigationBarState
    extends State<FloatingBottomNavigationBar> {
  final AppDelegate _appDelegate = AppDelegate.getInstance();
  final Color _containerColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.withAppBar
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back,
                    color: _appDelegate.getColor("Text")),
              ),
              title: const AutoText(
                'Floating Bottom NavBar',
                fontSize: 24,
              ),
              backgroundColor: _appDelegate.getColor("Background"),
            )
          : null,
      body: Stack(children: [
        widget.pages[widget.currentPage.value],
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            RoundedContainer(
              padding: 8,
              margin: 16,
              height: widget.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  widget.pages.length,
                  (index) => Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        onTap: () {
                          setState(() {
                            widget.currentPage.value = index;
                          });
                        },
                        child: RoundedContainer(
                          color: _containerColor,
                          height:
                              widget.height != null ? widget.height! - 16 : 74,
                          width: MediaQuery.of(context).size.width /
                                  widget.pages.length -
                              32,
                          child: widget.style == NavigationBarStyle.classic
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      widget.selectedIcons != null &&
                                              widget.currentPage.value == index
                                          ? widget.selectedIcons![index]
                                          : widget.icons![index],
                                      color: widget.currentPage.value == index
                                          ? widget.color != null
                                              ? widget.color![index]
                                              : _appDelegate.getColor("Text")
                                          : _appDelegate.getColor("Grey"),
                                    ),
                                    AutoText(
                                      widget.labels![index],
                                      textColor: widget.currentPage.value ==
                                              index
                                          ? widget.color != null
                                              ? widget.color![index]
                                              : _appDelegate.getColor("Text")
                                          : _appDelegate.getColor("Grey"),
                                    ),
                                  ],
                                )
                              : widget.style == NavigationBarStyle.icons
                                  ? Icon(
                                      widget.icons![index],
                                      color: widget.currentPage.value == index
                                          ? widget.color != null
                                              ? widget.color![index]
                                              : _appDelegate.getColor("Text")
                                          : _appDelegate.getColor("Grey"),
                                    )
                                  : Center(
                                      child: AutoText(
                                      textAlign: TextAlign.center,
                                      widget.labels![index],
                                      textColor: widget.currentPage.value ==
                                              index
                                          ? widget.color != null
                                              ? widget.color![index]
                                              : _appDelegate.getColor("Text")
                                          : _appDelegate.getColor("Grey"),
                                    )),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
