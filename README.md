# Components Toolbox

A basic Toolbox for Flutter components with AppDelegate to manage the light and dark theme.

## Components
The toolbox class has the following components:

- **Rounded Container**: A container with rounded corners.
- **Text Field**: A text field with a label.
- **Rounded Button**: A button with a label (and an icon).
- **Text Button**: A button with a label.
- **Markdown Text**: A text that can parse markdown.
- **Carousel**: A carousel that can be embedded on any component.
- **Custom Navigation Bar**: A custom navigation bar with a title and a back button.
- **Loader**: A loader that can be embedded on any component.
- **Theme Switcher**: A switcher that can change the theme of the app.
- **Floating Navigation Bar**: A navigation bar that can float on the screen.
- **AutoText**: A text that can be resized automatically.
- **Custom Colors**: A class that can be used to set custom colors for the app.
- **AutoScaleAnimatedColumn**: A column that can be animated and resized automatically.
- **SpacedColumn**: A column that have a space between each child.

## Getting Started

To use this class, you need to add the following dependency in your pubspec.yaml file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  components_toolbox: ^6.0.3+1
```

Then, you need to import the class in your file:

```dart
import 'package:components_toolbox/components_toolbox.dart';
```

## Usage

### Rounded Container

[rounded_container.png](assets/rounded_container.png)

```dart
RoundedContainer(
  child: Text('Hello World!'),
),
```

### Text Field

[custom_text_field.png](assets/custom_text_field.png)

```dart
const CustomTextField("Simple"),
const SizedBox(height: 16),
const CustomTextField(
    "Obscure",
    obscureText: true,
),
```

### Rounded Button

[rounded_button.png](assets/rounded_buttons.png)

```dart
Center(
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Row(
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
        AutoTextButton(
            "TextButton",
            onPressed: () {},
        ),
    ],
),
```

## Dependencies
The project uses the following dependencies as specified in `pubspec.yaml`:

- `shared_preferences`: Used to store the selected app theme (dark or light)