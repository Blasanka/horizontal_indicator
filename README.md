## horizontal_indicator

This package provides you horizontal date indicator.

Implementation:

Add `horizontal_indicator: <version>` to your pubspec.yaml file.
Then use `DateIndicator()` as a child of your any widget.
That's it.

To get latest `<version>` click on **installing** tab above.

TODO: - Support anyother format like date. - Add Only date indicator option and page option.

Note that this package uses `intl: ^0.16.0` for supporting formated date.

#### Example One (Basic / Default):

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

Screenshots:

![Complete Page Flutter Date Indicator](/Screenshot_2.png?raw=true "Complete Page Flutter Date Indicator")

![In a widget Flutter Date Indicator](/Screenshot_1.png?raw=true "In a Widget Flutter Date Indicator")

#### Example two with holder tap action

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