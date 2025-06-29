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
    <img src="https://francodev.live/github/circularmenupackage/3.gif" width="200" />
  </div>
  <br>
  <div>
    <b>Rotating Animation:</b><br>
    <img src="https://francodev.live/github/circularmenupackage/2.gif" width="200" />
  </div>
  <br>
  <div>
    <b>Orbit Animation:</b><br>
    <img src="https://francodev.live/github/circularmenupackage/1.gif" width="200" />
  </div>
</div>

## Features

- Circular menu with a large central circle.
- Smaller circles around the central circle acting as buttons.
- Full customization of colors, sizes, and behaviors.
- Ability to adjust the distance of the smaller circles from the central circle.
- Central circle with customizable circular buttons.
- Three animation styles: bouncing, rotating, orbit.
- Complete customization of colors, sizes, and behaviors.
- Toggle animations with a simple boolean.
- Add images in the items
- **NEW**: Central wave effect - The central circle can display animated wave effects while the orbiting items maintain their normal animation.
- Fixed big details! 🙇🏾

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
    animationDuration: const Duration(seconds: 15),
    animationType: OrbitMenuAnimationType.bouncing,
    menuPositionX: widthSize / 2,
    menuPositionY: heightSize / 2,
    menuColor: const Color.fromARGB(255, 1, 1, 1),
    radius: 100,
    menuItems: itemList,
    itemSize: 100,
    borderCentralMenu: Border.all(color: Colors.red, width: 5),
    itemOffsetPercentage: 1,
    enableCentralWaveEffect: true,
  ),
);
```

### Central Wave Effect

The central wave effect creates beautiful animated waves emanating from the center circle while keeping the orbiting items unchanged. This creates a stunning visual effect where the center "breathes" with waves.

```dart
OrbitMenuConfig(
  // ... other configuration
  enableCentralWaveEffect: true,
)
```

## Add your custom widget

Now, You can add your custom widget to the list of widgets orbiting around the parent circle. Keep in mind that you should declare the size
within the configuration as itemSize to keep the elements in sync with the parent circle. Your widget will be embedded within a
parent container.

```dart
AnimatedOrbitMenu(
  animate: true,
  config: OrbitMenuConfig(
    animationDuration: Duration(seconds: 5),
    animationType: OrbitMenuAnimationType.rotating,
    menuPositionX: widthSize / 2,
    menuPositionY: heightSize / 2,
    menuColor: Colors.deepPurple,
    radius: 100,
    menuItems: itemList,
    itemSize: 150,
    titleStyle: TextStyle(color: Colors.white),
    itemOffsetPercentage: 0.5,
    myWidget: Container(color: Colors.red,)
  )
),
```

## Example

<div align="center">
  <div>
    <b>My Widget Bouncing Animation:</b><br>
    <img src="https://francodev.live/github/circularmenupackage/personalizado.gif" width="200" />
  </div>
  <br>
</div>

### Contributions to this package are welcome.

If you find a bug or have a suggestion, please open an issue or a pull request.
