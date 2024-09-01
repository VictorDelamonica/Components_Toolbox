// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  State<BottomNavBarExample> createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  final List<Widget> _pages = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];
  final List<String> _labels = ['Home', 'Search', 'Settings'];
  final List<IconData> _icons = [Icons.home, Icons.search, Icons.settings];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back,
                color: AppDelegate.getInstance().getColor("Text")),
          ),
          title: const AutoText(
            'Bottom Navigation Bar',
            fontSize: 24,
          ),
          backgroundColor: AppDelegate.getInstance().getColor("Background"),
        ),
        body: ValueListenableBuilder<int>(
            valueListenable: _currentPage,
            builder: (context, value, child) {
              return _pages[value];
            }),
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: _currentPage,
          pages: _pages,
          labels: _labels,
          icons: _icons,
          selectedColors: const [Colors.red, Colors.green, Colors.blue],
          unselectedColors: AppDelegate.getInstance().getColor("Text"),
        ));
  }
}
