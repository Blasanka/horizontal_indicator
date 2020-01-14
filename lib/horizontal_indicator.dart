library horizontal_indicator;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyInheritedWidget extends InheritedWidget {
  final DateTime date;
  final int selectedDay;
  final int monthDateCount;
  final bool isDateHolderActive;
  final List<int> activeHolders;
  final ValueChanged<bool> toggleDateHolderActive;
  final ValueChanged<int> setSelectedDay;

  MyInheritedWidget({
    Key key,
    this.date,
    this.selectedDay,
    this.monthDateCount,
    this.isDateHolderActive,
    this.activeHolders,
    this.toggleDateHolderActive,
    this.setSelectedDay,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.selectedDay != selectedDay ||
        oldWidget.toggleDateHolderActive != toggleDateHolderActive;
  }
}

class DateIndicator extends StatefulWidget {
  final Color holderColor;
  final Color activeBubbleColor;
  final Color textColor;
  final Color numberColor;
  final Color selectedBorderColor;
  final Color unSelectedBorderColor;
  final Color indicatorShadowColor;
  final Color indicatorColor;
  final int initialDay;
  final List<int> activeHolders;
  final ValueChanged<int> onHolderTap;

  DateIndicator({
    this.holderColor,
    this.activeBubbleColor,
    this.textColor,
    this.numberColor,
    this.selectedBorderColor,
    this.unSelectedBorderColor,
    this.indicatorShadowColor,
    this.indicatorColor,
    this.initialDay,
    this.activeHolders,
    this.onHolderTap,
  });

  static MyInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  _DateIndicatorState createState() => _DateIndicatorState();
}

class _DateIndicatorState extends State<DateIndicator> {
  DateTime date = DateTime.now();
  int monthDateCount = 1;
  int selectedDay = 1;
  bool isDateHolderActive = false;

  void toggleDateHolderActive(bool flag) {
    setState(() {
      isDateHolderActive = flag;
    });
  }

  void setSelectedDay(int index) {
    setState(() {
      selectedDay = index;
    });
  }

  @override
  void initState() {
    final DateTime dateForValues = new DateTime(date.year, date.month + 1, 0);
    monthDateCount = dateForValues.day;
    if (widget.initialDay != null) {
      setSelectedDay(widget.initialDay-1);
      toggleDateHolderActive(true);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 68.0,
      padding:
          const EdgeInsets.only(left: 7.0, right: 3.0, top: 2.0, bottom: 2.0),
      decoration: BoxDecoration(
        color: widget.indicatorColor ?? Theme.of(context).secondaryHeaderColor,
        boxShadow: [
          BoxShadow(
              color: widget.indicatorShadowColor ?? Colors.blueAccent.withOpacity(.7),
              offset: Offset(0.0, .5),
              blurRadius: 3.0,
              spreadRadius: 0.3),
        ],
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: monthDateCount, // to avoid showing zero
          itemBuilder: (BuildContext context, int index) {
            return MyInheritedWidget(
                date: date,
                selectedDay: selectedDay,
                monthDateCount: monthDateCount,
                isDateHolderActive: isDateHolderActive,
                activeHolders: widget.activeHolders,
                toggleDateHolderActive: toggleDateHolderActive,
                setSelectedDay: setSelectedDay,
                child: DateHolder(
                  index,
                  holderColor: widget.holderColor,
                  activeColor: widget.activeBubbleColor,
                  textColor: widget.textColor,
                  numberColor: widget.numberColor,
                  selectedBorderColor: widget.selectedBorderColor,
                  unSelectedBorderColor: widget.unSelectedBorderColor,
                  onTap: widget.onHolderTap,
                ));
          }),
    );
  }
}

class DateHolder extends StatelessWidget {
  DateHolder(
    this.index, {
    this.holderColor,
    this.activeColor,
    this.textColor,
    this.numberColor,
    this.selectedBorderColor,
    this.unSelectedBorderColor,
    this.onTap,
    this.activeHolders,
  });

  final int index;
  final Color holderColor;
  final Color activeColor;
  final Color textColor;
  final Color numberColor;
  final Color selectedBorderColor;
  final Color unSelectedBorderColor;
  final ValueChanged<int> onTap;
  final List<int> activeHolders;

  Widget activeBubble() => Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: activeColor ?? Colors.deepOrangeAccent,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final appState = DateIndicator.of(context);

    return InkWell(
      onTap: () {
        appState.toggleDateHolderActive(true);
        appState.setSelectedDay(index);
        onTap(index+1);
      },
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: Text(
                    "${DateFormat('EEEE').format(DateTime(appState.date.year, appState.date.month, index)).substring(0, 1)}",
                    style: TextStyle(
                        color: textColor ?? Theme.of(context).primaryColor,
                        fontSize: 12.0),
                  )),
              Container(
                width: 45.0,
                height: 45.0,
                margin: const EdgeInsets.only(right: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: holderColor ?? Colors.white,
                  border: (index == (appState.selectedDay) &&
                          appState.isDateHolderActive == true)
                      ? Border.all(
                          width: 2.0,
                          color: selectedBorderColor ??
                              Theme.of(context).primaryColor)
                      : Border.all(
                          color: unSelectedBorderColor ?? Colors.transparent),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "${index + 1}", // to avoid showing zero
                      style: TextStyle(
                          color: numberColor ?? Theme.of(context).primaryColor,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          (appState.activeHolders?.contains(index+1) ?? false)
              ? Positioned(right: 8.0, bottom: 5.0, child: activeBubble())
              : Container(),
        ],
      ),
    );
  }
}
