// All rights reserved
// Monikode Mobile Solutions and Draw Your Fight
// Created by MoniK on 2024.

import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';

enum NavigationBarStyle {
  classic,
  icons,
  texts,
  images,
}

class CustomNavigationBar extends StatefulWidget {
  final NavigationBarStyle style;
  final List<Widget> pages;
  final ValueNotifier<int> currentIndex;
  final List<IconData>? icons;
  final List<String>? labels;
  final List<Color>? selectedColors;
  final Color? unselectedColors;
  final Color? backgroundColor;
  const CustomNavigationBar(
      {super.key,
      this.style = NavigationBarStyle.classic,
      required this.pages,
      this.icons,
      this.labels,
      this.selectedColors,
      required this.currentIndex,
      this.unselectedColors,
      this.backgroundColor})
      : assert(pages.length > 1 &&
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

class FloatingBottomNavigationBar extends StatefulWidget {
  final List<Widget> pages;
  final ValueNotifier<int> currentPage;
  final NavigationBarStyle style;
  final double? height;
  final List<Color>? color;
  final List<String>? labels;
  final List<IconData>? icons;
  final bool withAppBar;
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
                                      widget.icons![index],
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
