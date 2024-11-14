// All rights reserved
// Monikode Mobile Solutions
// Created by MoniK on 2024.

/// This library provides various components for the toolbox.
///
/// It includes widgets and utilities that can be used across the application.
library components_toolbox;

// Your existing imports and code here

/// region Components
export './components/auto_scale_animated_column.dart'
    show AutoScaleAnimatedColumn;
export './components/auto_text.dart' show AutoText;
export './components/carousel.dart' show Carousel;
export './components/loader.dart' show Loader;
export './components/markdown_text.dart' show MarkdownText;
export './components/navigation_bar.dart'
    show CustomNavigationBar, NavigationBarStyle, FloatingBottomNavigationBar;
export './components/rounded_buttons.dart'
    show
        RoundedButton,
        RoundedButtonWithIcons,
        OutlinedRoundedButton,
        CircleButton,
        AutoTextButton;
export './components/rounded_container.dart' show RoundedContainer;
export './components/text_field.dart' show CustomTextField;

/// endregion

/// region Utils
export './utils/app_delegate.dart' show AppDelegate, Appearance;
export './utils/colors.dart' show CustomColors, CustomColor;
export './utils/shadows.dart' show CustomShadows;
export 'components/theme_switcher.dart' show ThemeSwitcher, ThemeSwitcherStyle;

/// endregion
