## horizontal_indicator

This package provides you horizontal date horizontal_indicator.

##### Description:

Horizontal date horizontal_indicator flutter package for letting developers easily get days of current month as horizontal scrollable bar that can add anywhere in a widget tree. Can mark specific days(to show available or active or to improve user experience). Can get the selected day or can perform task when selecting a day on the horizontal_indicator.

##### Get this package to your project:

Add `horizontal_indicator: <version>` to your pubspec.yaml file.
Then use `DateIndicator()` as a child of your any widget.
That's it.

To get latest `<version>` click on **installing** tab above.

##### Implementation:

 - Use default color and sizes or provide args to `DateIndicator()` constructor.
 - Set `initialDay` value to select when first run (By default will not select any day).
 - Get the selected holder value/day by using `onHolderTap`.

Please see examples and doc comments in the bottom for more.

#### Notices:

This package uses `intl: ^0.16.0` for supporting formated date.

##### Example One (Basic / Default):

```
import 'package:flutter/material.dart';
import 'package:horizontal_indicator/horizontal_indicator.dart';

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

##### Screenshots:

![active bubble top horizontal calendar flutter package blasanka](https://raw.githubusercontent.com/Blasanka/horizontal_indicator/master/active_bubble_top_horizontal_calendar_flutter_package_by_blasanka.png "active bubble top horizontal calendar flutter package blasanka")

![active bubble top horizontal calendar flutter package horizontal](https://raw.githubusercontent.com/Blasanka/horizontal_indicator/master/active_bubble_top_horizontal_calendar_flutter_package_horizontal.png "active bubble top horizontal calendar flutter package blasanka")

![Complete Page Flutter Date horizontal_indicator](https://raw.githubusercontent.com/Blasanka/horizontal_indicator/master/Screenshot_2.png "Complete Page Flutter Date horizontal_indicator")

![In a widget Flutter Date horizontal_indicator](https://raw.githubusercontent.com/Blasanka/horizontal_indicator/master/Screenshot_1.png "In a Widget Flutter Date horizontal_indicator")

##### Example two with holder tap action

```
import 'package:flutter/material.dart';
import 'package:horizontal_indicator/horizontal_indicator.dart';

class DateIndicatorPage extends StatefulWidget {

  @override
  _DateIndicatorPageState createState() => _DateIndicatorPageState();
}

class _DateIndicatorPageState extends State<DateIndicatorPage> {
  int selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 68),
          child: DateIndicator(
            onHolderTap: (int day) => setState(() => selectedDay = day),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(child: Text("$selectedDay")),
            ),
          ),
        ],
      ),
    );
  }
}
```

##### Doc comments

```
/// @param [`indicatorWidth`]: default to device width.
///
/// @param [`indicatorHeight`]: default to `68.0`. If you are changing this below params also should change to stop layout becoming ugly.
///
/// @param [`circleHolderWidth`]: default to `45.0`.
///
/// @param [`circleHolderHeight`]: default to `45.0`.
///
/// @param [`activeBubbleWidth`]: default to `15.0`.
///
/// @param [`activeBubbleHeight`]: default to `15.0`.
///
/// @param  [`activeBubbleRightPosition`]: default to `8.0`, adjust the right position of the active bubble
///
/// @param  [`activeBubbleLeftPosition`]: default to `20.0`, adjust the left position of the active bubble
///
/// @param  [`activeBubbleBottomPosition`]: default to `5.0`, adjust the bottom position of the active bubble
///
/// @param [`hideDayOfWeek`]: default to `false`, on top of the circle holder three letters of the day of the week  is displaying
///
/// @param [`initialDay`]: for to select specific day when this widget first display
///
/// @param [`jumpToInitialDay`]: set to `true` by default, this will scroll the day holder list view to initial day
///
/// @param [`activeHolders`]: default to empty list, that means no date holder shows active bubble.
/// to show active bubbles provide *day of month* as a `int` `List`. Ex: If January `[1,2,31]`, depending on the month end day have to be correct.
///
/// @param [`onHolderTap`]: is a function with an integer parameter to for you to access day selected value. ```(int i) => setState(() => yourVar = i)```,
///
/// @param [`updateSelectedDay`]: If not null, will change the holder selection to that day(should be between month days. Ex: 1-31).
/// 
/// Check this example: https://github.com/Blasanka/horizontal_indicator/blob/master/example/lib/main.dart
```

##### available params

```
const DateIndicator({
    this.holderColor,
    this.activeBubbleColor,
    this.textColor,
    this.numberColor,
    this.selectedBorderColor,
    this.unSelectedBorderColor,
    this.horizontal_indicatorShadowColor,
    this.horizontal_indicatorColor,
    this.horizontal_indicatorWidth, // default to device width, ignore this if you need full width of the device
    this.horizontal_indicatorHeight = 68.0,
    this.circleHolderWidth = 45.0,
    this.circleHolderHeight = 45.0,
    this.activeBubbleWidth = 15.0,
    this.activeBubbleHeight = 15.0,
    this.activeBubbleRightPosition = 8.0,
    this.activeBubbleLeftPosition = 20.0,
    this.activeBubbleBottomPosition = 5.0,
    this.hideDayOfWeek = false,
    this.initialDay,
    this.activeHolders,
    this.onHolderTap,
    this.updateSelectedDay,
});
```

Read library document: https://pub.dev/documentation/horizontal_indicator/latest/horizontal_indicator/DateIndicator-class.html

##### Need to contribute?

You are welcome(Currently there is no guideline but give your pull request I will review and let you know). 

##### Having an issue?

If you encounter any bug or confused with this package or even your suggestions, please send your valuable mail to blasanka95@yahoo.com