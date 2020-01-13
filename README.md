# horizontal_indicator

This package provides you horizontal date indicator.

Description:

Horizontal date indicator flutter package for letting developers easily get days of months as horizontal scrollable bar that can add anywhere. Can mark specific days(to show available or active or to improve user experience). Can get the selected day or can perform task when selecting a day on the indicator.

Implementation:

Add `horizontal_indicator: <version>` to your pubspect.yaml file.
Then use `DateIndicator()` as a child of your any widget.
That's it.

TODO: - Support anyother format like date. - Add Only date indicator option and page option.

Note that this package uses `intl: ^0.16.0` for supporting formated date.

## Example:

```
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SO answers sample snippet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DateIndicatorPage(),
    );
  }
}

class DateIndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            DateIndicator(),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
```

Go to example directory to see demo app with how to change colors:
https://github.com/Blasanka/horizontal_indicator/tree/master/example

Screenshots:

![Complete Page Flutter Date Indicator](/Screenshot_2.png?raw=true "Complete Page Flutter Date Indicator")

![In a widget Flutter Date Indicator](/Screenshot_1.png?raw=true "In a Widget Flutter Date Indicator")

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
