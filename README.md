# OrbitMenu Flutter Package

## Description

OrbitMenu is a Flutter package designed for creating interactive and visually appealing circular menus in mobile applications. It features a large central circle surrounded by smaller circles that function as buttons. This package enables Flutter developers to incorporate intuitive and aesthetically pleasing navigation in their apps.

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

## Features

- Circular menu with a large central circle.
- Smaller circles around the central circle acting as buttons.
- Full customization of colors, sizes, and behaviors.
- Ability to adjust the distance of the smaller circles from the central circle.

## Installation

To use OrbitMenu in your Flutter project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  orbitmenu: ^latest_version
```

Then, run flutter pub get to install the package.


## Usage

To implement the circular menu in your Flutter app, follow these steps:

Import OrbitMenu in your Dart file:

```dart
import 'package:orbitmenu/orbitmenu.dart';
```

Use the OrbitMenu class to create the menu:

```dart 
    OrbitMenu.createMenu(
menuPositionX: 100,  // X position of the menu
menuPositionY: 100,  // Y position of the menu
menuColor: Colors.blue,  // Color of the central circle
radius: 60,  // Radius of the central circle
menuItems: [  // Menu items
Item(title: 'Home', onPressed: () {}),
// ... more items ...
],
itemSize: 20,  // Size of the item circles
itemColor: Colors.white,  // Color of the item circles
itemBorderColor: Colors.black,  // Border color of the item circles
borderCentralMenuColor: Colors.black,  // Border color of the central circle
animationOffset: 500,  // Animation offset
itemOffsetPercentage: 0.1,  // Item offset percentage
)
```
### Contributions to this package are welcome.

If you find a bug or have a suggestion, please open an issue or a pull request.