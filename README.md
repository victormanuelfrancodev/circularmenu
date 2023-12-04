# OrbitMenu Flutter Package

## Description

OrbitMenu is a versatile Flutter package for creating dynamic circular menus with interactive animations. It now features new animation styles - bouncing and rotating, enhancing user engagement.


### You can achieve with this package : 

<div align="center">
  <div>
    <img src="https://francodev.live/github/extrano.png" width="100" />
  </div>
  <div>
    <img src="https://francodev.live/github/menucircular.png" width="100" />
  </div>
  <div>
    <img src="https://francodev.live/github/rojo.png" width="100" />
  </div>
</div>

## Animation Examples

<div align="center">
  <div>
    <b>Bouncing Animation:</b><br>
    <img src="https://francodev.live/github/circularmenupackage/bouncingg.gif" width="200" />
  </div>
  <br>
  <div>
    <b>Rotating Animation:</b><br>
    <img src="https://francodev.live/github/circularmenupackage/girando.gif" width="200" />
  </div>
</div>

## Features

- Circular menu with a large central circle.
- Smaller circles around the central circle acting as buttons.
- Full customization of colors, sizes, and behaviors.
- Ability to adjust the distance of the smaller circles from the central circle.
- Central circle with customizable circular buttons.
- Two animation styles: bouncing and rotating.
- Complete customization of colors, sizes, and behaviors.
- Toggle animations with a simple boolean.


## Installation

To use OrbitMenu in your Flutter project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  orbitmenu: ^latest_version
```

Then, run flutter pub get to install the package.


## Usage

To implement the circular menu in your Flutter app, follow these steps:

Import and use AnimatedOrbitMenu in your Dart file:

```dart
import 'package:orbitmenu/animated_orbit_menu.dart';
import 'package:orbitmenu/orbit_menu_config.dart';
import 'package:orbitmenu/orbit_menu_animation_type.dart';
```

Use the AnimatedOrbitMenu class to create the menu:

```dart 

    AnimatedOrbitMenu(
      animate: true,
      config: OrbitMenuConfig(
      animationDuration: Duration(seconds:5),
      animationType: OrbitMenuAnimationType.rotating,
      menuPositionX: widthSize / 2,
      menuPositionY: heightSize / 2,
      menuColor: Colors.deepPurple,
      radius: 100,
      menuItems: itemList,
      titleStyle: TextStyle(color: Colors.white),
      itemSize: 50,
      itemColor: Colors.deepPurple,
      itemBorderColor: Colors.white,
      borderCentralMenuColor: Colors.white,
      itemOffsetPercentage: 0.5,
      ),
    );
```
### Contributions to this package are welcome.

If you find a bug or have a suggestion, please open an issue or a pull request.