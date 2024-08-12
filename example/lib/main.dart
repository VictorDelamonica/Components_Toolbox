import 'package:components_toolbox/components_toolbox.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppDelegate.getInstance().setStoredAppearance();
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final AppDelegate _appDelegate = AppDelegate.getInstance();
  final containerSize = 150;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _appDelegate.getColor("Background"),
        appBar: AppBar(
          title: const AutoText('Toolbox Example App', fontSize: 24),
          backgroundColor: _appDelegate.getColor("AppBar"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
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
                  'Rounded Container:',
                  fontSize: 24,
                ),
                const AutoText(
                  'Background Color',
                  fontSize: 18,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
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
                  child: Container(
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
                const AutoText(
                  'TextField:',
                  fontSize: 24,
                ),
                const CustomTextField("Simple", null),
                const SizedBox(height: 16),
                const CustomTextField(
                  "Obscure",
                  null,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
