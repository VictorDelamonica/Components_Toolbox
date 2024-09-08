// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.
import 'package:components_toolbox/components/navigation_bar.dart';
import 'package:components_toolbox/components_toolbox.dart';
import 'package:example/bottom_nav_bar_example.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDelegate.getInstance().setStoredAppearance();

  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeExample(),
    );
  }
}

class HomeExample extends StatefulWidget {
  const HomeExample({super.key});

  @override
  State<HomeExample> createState() => _HomeExampleState();
}

class _HomeExampleState extends State<HomeExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final AppDelegate _appDelegate = AppDelegate.getInstance();
  final containerSize = 150.0;
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  final ValueNotifier<bool> _value = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _testValue = ValueNotifier<bool>(false);

  Future<void> updateValue() async {
    await Future.delayed(const Duration(seconds: 1));
    _testValue.value = true;
  }

  @override
  void initState() {
    super.initState();
    CustomColors.colorNotifier.addListener(() {
      setState(() {});
    });
    _appDelegate.appearanceNotifier.addListener(() {
      setState(() {});
    });
    updateValue();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppDelegate.getInstance().getAppearance();
    return Scaffold(
      backgroundColor: AppDelegate.getInstance().getColor("Background"),
      appBar: AppBar(
        title: const AutoText('Toolbox Example App', fontSize: 24),
        backgroundColor: _appDelegate.getColor("AppBar"),
      ),
      body: Loader(
        value: _testValue,
        icon: Icons.handyman_rounded,
        page: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),

                ///region Appearance
                const AutoText(
                  'Select appearance:',
                  fontSize: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        _appDelegate.setAppearance(Appearance.light);
                        setState(() {});
                      },
                      child: const Text('Light'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _appDelegate.setAppearance(Appearance.dark);
                        setState(() {});
                      },
                      child: const Text('Dark'),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const AutoText(
                  'Change custom colors:',
                  fontSize: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        CustomColors.resetColors();
                        setState(() {});
                      },
                      child: const Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        CustomColors.setColor(
                            CustomColor.background, Colors.red);
                        CustomColors.setColor(CustomColor.appBar, Colors.green);
                        CustomColors.setColor(CustomColor.dark, Colors.blue);
                        CustomColors.setColor(CustomColor.light, Colors.yellow);
                        CustomColors.setColor(
                            CustomColor.backgroundDark, Colors.purple);
                        CustomColors.setColor(
                            CustomColor.appBarDark, Colors.orange);
                        CustomColors.setColor(
                            CustomColor.darkDark, Colors.pink);
                        CustomColors.setColor(
                            CustomColor.lightDark, Colors.teal);
                      },
                      child: const Text('Change'),
                    )
                  ],
                ),
                const SizedBox(height: 32),

                ///endregion
                ///region RoundedContainer
                const AutoText(
                  'Rounded Container:',
                  fontSize: 24,
                ),
                const AutoText(
                  'Background Color',
                  fontSize: 18,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: SizedBox(
                    height: containerSize + 50,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const AutoText("Simple"),
                            Center(
                              child: RoundedContainer(
                                color: _appDelegate.getColor("Light"),
                                height: containerSize,
                                width: containerSize,
                                child: const Center(
                                    child: AutoText('Hello World!')),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            const AutoText("Shadow"),
                            Center(
                              child: RoundedContainer(
                                color: _appDelegate.getColor("Light"),
                                height: containerSize,
                                width: containerSize,
                                shadow: CustomShadows.regular,
                                child: const Center(
                                    child: AutoText('Hello World!')),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            const AutoText("Border"),
                            Center(
                              child: RoundedContainer(
                                color: _appDelegate.getColor("Light"),
                                height: containerSize,
                                width: containerSize,
                                border: Border.all(
                                  color: _appDelegate.getColor("Text"),
                                  width: 2,
                                ),
                                child: const Center(
                                    child: AutoText('Hello World!')),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const AutoText(
                  'Colored',
                  fontSize: 18,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: SizedBox(
                    height: containerSize + 50,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const AutoText("Simple"),
                            Center(
                              child: RoundedContainer(
                                color: Colors.red,
                                height: containerSize,
                                width: containerSize,
                                child: const Center(
                                    child: AutoText('Hello World!')),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            const AutoText("Shadow"),
                            Center(
                              child: RoundedContainer(
                                color: Colors.green,
                                height: containerSize,
                                width: containerSize,
                                shadow: CustomShadows.regular,
                                child: const Center(
                                    child: AutoText('Hello World!')),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            const AutoText("Border"),
                            Center(
                              child: RoundedContainer(
                                color: Colors.blue,
                                height: containerSize,
                                width: containerSize,
                                border: Border.all(
                                  color: _appDelegate.getColor("Text"),
                                  width: 2,
                                ),
                                child: const Center(
                                    child: AutoText('Hello World!')),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                ///endregion
                ///region CustomTextField
                const AutoText(
                  'TextField:',
                  fontSize: 24,
                ),
                const CustomTextField("Simple"),
                const SizedBox(height: 16),
                const CustomTextField(
                  "Obscure",
                  obscureText: true,
                ),
                const SizedBox(height: 32),

                ///endregion
                ///region RoundedButton
                const AutoText(
                  'Rounded Button:',
                  fontSize: 24,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedButton(
                          text: 'Simple',
                          onPressed: () {},
                          width: MediaQuery.of(context).size.width / 2 - 32,
                        ),
                        RoundedButton(
                          text: 'Shadow',
                          onPressed: () {},
                          shadow: CustomShadows.regularCentered,
                          width: MediaQuery.of(context).size.width / 2 - 32,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                RoundedButtonWithIcons(
                  Icons.save,
                  text: "With Icon",
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: OutlinedRoundedButton(
                        "Outlined",
                        onPressed: () {},
                        width: 150,
                      ),
                    ),
                    CircleButton(
                      icon: Icons.add,
                      onPressed: () {},
                    ),
                    AutoTextButton("TextButton", onPressed: () {}),
                  ],
                ),
                const SizedBox(height: 24),

                ///endregion
                ///region MarkdownText
                const AutoText(
                  "Markdown Text:",
                  fontSize: 24,
                ),
                const MarkdownText(
                  paragraphs: [
                    "Le **Lorem Ipsum** est simplement du faux texte employé dans la composition **et** la mise en page avant impression.",
                  ],
                ),
                const SizedBox(height: 24),

                ///endregion
                ///region Carousel
                const AutoText(
                  'Carousel:',
                  fontSize: 24,
                ),
                const Carousel(
                  images: [
                    {"image": "assets/one.webp", "text": "Description 1"},
                    {"image": "assets/two.jpg", "text": ""},
                    {
                      "image": "assets/three.jpg",
                      "text": "The second has no text"
                    },
                    {"image": "assets/four.jpg", "text": "Other TEXT"},
                  ],
                ),
                const SizedBox(height: 16),

                ///endregion
                ///region NavigationBar
                const AutoText(
                  'Navigation Bar:',
                  fontSize: 24,
                ),
                RoundedButtonWithIcons(Icons.arrow_forward,
                    text: "Go to Bottom NavBar", onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavBarExample()));
                }),
                const SizedBox(height: 16),
                RoundedButtonWithIcons(Icons.arrow_forward,
                    text: "Go to Floating Bottom NavBar", onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FloatingBottomNavigationBar(
                        pages: [
                          Container(color: Colors.red),
                          Container(color: Colors.green),
                          Container(
                            color: Colors.blue,
                            child: ThemeSwitcher(
                              style: ThemeSwitcherStyle.switched,
                            ),
                          ),
                        ],
                        currentPage: _currentPage,
                        style: NavigationBarStyle.classic,
                        icons: const [
                          Icons.home_outlined,
                          Icons.search_outlined,
                          Icons.settings_outlined
                        ],
                        selectedIcons: const [
                          Icons.home,
                          Icons.search,
                          Icons.settings
                        ],
                        labels: const ['Home', 'Search', 'Settings'],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),

                ///endregion
                //region ThemeSwitcher
                const AutoText("Theme Switcher", fontSize: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ThemeSwitcher(),
                    ThemeSwitcher(
                      darkColor: Colors.red,
                      lightColor: Colors.green,
                    ),
                    ThemeSwitcher(
                      darkIconColor: Colors.yellow,
                      lightIconColor: Colors.blue,
                    ),
                  ],
                ),
                const ThemeSwitcher(
                  style: ThemeSwitcherStyle.switched,
                ),
                const ThemeSwitcher(
                  style: ThemeSwitcherStyle.switched,
                  darkColor: Colors.red,
                ),
                const SizedBox(height: 16),

                ///endregion
                /// region Loader
                ///
                const AutoText(
                  'Loaders:',
                  fontSize: 24,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedButton(
                        text: "Loading...",
                        width: MediaQuery.of(context).size.width / 2 - 32,
                        onPressed: () {
                          setState(() {
                            _value.value = false;
                          });
                        }),
                    RoundedButton(
                        text: "Loaded !!",
                        width: MediaQuery.of(context).size.width / 2 - 32,
                        onPressed: () {
                          setState(() {
                            _value.value = true;
                          });
                        })
                  ],
                ),
                Loader(
                  page: const Center(
                      child: RoundedContainer(child: AutoText("Loaded !!"))),
                  value: _value,
                ),
                const SizedBox(height: 16),
                Loader(
                  icon: Icons.handyman_rounded,
                  color: Colors.red,
                  page: const Center(
                      child: RoundedContainer(child: AutoText("Loaded !!"))),
                  value: _value,
                ),
                const SizedBox(height: 16),
                Loader(
                  imagePath: "assets/one.webp",
                  imageSize: 50,
                  page: const Center(
                      child: RoundedContainer(child: AutoText("Loaded !!"))),
                  value: _value,
                ),
                const SizedBox(height: 16),

                /// endregion
              ],
            ),
          ),
        ),
      ),
    );
  }
}
