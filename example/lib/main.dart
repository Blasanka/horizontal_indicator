import 'package:flutter/material.dart';
import 'package:horizontal_indicator/horizontal_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 68),
          child: DateIndicator(
            holderColor: Colors.lightBlueAccent.withOpacity(.5),
            numberColor: Colors.blueAccent,
            textColor: Colors.blue,
            activeBubbleColor: Colors.redAccent,
            unSelectedBorderColor: Colors.grey,
            selectedBorderColor: Colors.blueAccent,
            indicatorColor: Colors.greenAccent.withOpacity(.4),
            indicatorShadowColor: Colors.greenAccent.withOpacity(.3),
            activeHolders: [1,4,6,7,8,10,11,14,13,31,27],
            initialDay: _counter,
            onHolderTap: (int index) {
              debugPrint(index.toString());
              setState(() => _counter = index);
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
