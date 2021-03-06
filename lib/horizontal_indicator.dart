library horizontal_indicator;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _DateIndicatorInheritedWidget extends InheritedWidget {
  final DateTime date;
  final int selectedDay;
  final int monthDateCount;
  final bool isDateHolderActive;
  final List<int> activeHolders;
  final Color holderColor;
  final Color activeBubbleColor;
  final Color textColor;
  final Color numberColor;
  final Color selectedBorderColor;
  final Color unSelectedBorderColor;
  final Color indicatorShadowColor;
  final Color indicatorColor;
  final double indicatorWidth;
  final double indicatorHeight;
  final double circleHolderWidth;
  final double circleHolderHeight;
  final double activeBubbleWidth;
  final double activeBubbleHeight;
  final double activeBubbleRightPosition;
  final double activeBubbleLeftPosition;
  final double activeBubbleBottomPosition;
  final bool hideDayOfWeek;
  final int initialDay;
  final ValueChanged<bool> toggleDateHolderActive;
  final ValueChanged<int> setSelectedDay;

  const _DateIndicatorInheritedWidget({
    Key key,
    this.date,
    this.selectedDay,
    this.monthDateCount,
    this.isDateHolderActive,
    this.activeHolders,
    this.holderColor,
    this.activeBubbleColor,
    this.textColor,
    this.numberColor,
    this.selectedBorderColor,
    this.unSelectedBorderColor,
    this.indicatorShadowColor,
    this.indicatorColor,
    this.indicatorWidth,
    this.indicatorHeight,
    this.circleHolderWidth,
    this.circleHolderHeight,
    this.activeBubbleWidth,
    this.activeBubbleHeight,
    this.activeBubbleRightPosition,
    this.activeBubbleLeftPosition,
    this.activeBubbleBottomPosition,
    this.hideDayOfWeek,
    this.initialDay,
    this.toggleDateHolderActive,
    this.setSelectedDay,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_DateIndicatorInheritedWidget oldWidget) {
    return oldWidget.selectedDay != selectedDay ||
        oldWidget.toggleDateHolderActive != toggleDateHolderActive;
  }
}

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
class DateIndicator extends StatefulWidget {
  final Color holderColor;
  final Color activeBubbleColor;
  final Color textColor;
  final Color numberColor;
  final Color selectedBorderColor;
  final Color unSelectedBorderColor;
  final Color indicatorShadowColor;
  final Color indicatorColor;
  final double indicatorWidth;
  final double indicatorHeight;
  final double circleHolderWidth;
  final double circleHolderHeight;
  final double activeBubbleWidth;
  final double activeBubbleHeight;
  final double activeBubbleRightPosition;
  final double activeBubbleLeftPosition;
  final double activeBubbleBottomPosition;
  final bool hideDayOfWeek;
  final int initialDay;
  final bool jumpToInitialDay;
  final List<int> activeHolders;
  final ValueChanged<int> onHolderTap;
  final int updateSelectedDay;

  const DateIndicator({
    this.holderColor,
    this.activeBubbleColor,
    this.textColor,
    this.numberColor,
    this.selectedBorderColor,
    this.unSelectedBorderColor,
    this.indicatorShadowColor,
    this.indicatorColor,
    this.indicatorWidth, // default to device width, ignore this if you need full width of the device
    this.indicatorHeight = 68.0,
    this.circleHolderWidth = 45.0,
    this.circleHolderHeight = 45.0,
    this.activeBubbleWidth = 15.0,
    this.activeBubbleHeight = 15.0,
    this.activeBubbleRightPosition = 8.0,
    this.activeBubbleLeftPosition = 20.0,
    this.activeBubbleBottomPosition = 5.0,
    this.hideDayOfWeek = false,
    this.initialDay,
    this.jumpToInitialDay = true,
    this.activeHolders,
    this.onHolderTap,
    this.updateSelectedDay,
  });

  static _DateIndicatorInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  _DateIndicatorState createState() => _DateIndicatorState();
}

class _DateIndicatorState extends State<DateIndicator> {
  DateTime date = DateTime.now();
  int monthDateCount = 1;
  int selectedDay = 1;
  bool isDateHolderActive = false;

  // Controller to manage to jump to initial day
  ScrollController dateIndicatorController;

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

  void updateDaySelection(int day, String type) {
    if (day != null) {
      setSelectedDay(day);
      toggleDateHolderActive(true);

      if (widget.jumpToInitialDay) {
        setState(() {
          if (type == "initial") if (day > 6)
            dateIndicatorController.jumpTo(40.0 * day);
          else if (day <= 1)
            dateIndicatorController.jumpTo(0);
          else if (day > 1) dateIndicatorController.jumpTo(20.0 * day);
        });
      }
    }
  }

  @override
  void initState() {
    dateIndicatorController = ScrollController();

    final DateTime dateForValues = new DateTime(date.year, date.month + 1, 0);
    monthDateCount = dateForValues.day;

    super.initState();
  }

  @override
  void didUpdateWidget(DateIndicator oldWidget) {
    updateDaySelection(widget.initialDay, "initial");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    updateDaySelection(widget.updateSelectedDay, "update");

    return Container(
      width: widget.indicatorWidth ?? MediaQuery.of(context).size.width,
      height: widget.hideDayOfWeek
          ? (widget.indicatorHeight -
              17) // if day of week hide, no need to show extra space
          : widget.indicatorHeight,
      padding:
          const EdgeInsets.only(left: 7.0, right: 3.0, top: 2.0, bottom: 2.0),
      decoration: BoxDecoration(
        color: widget.indicatorColor ?? Theme.of(context).secondaryHeaderColor,
        boxShadow: [
          BoxShadow(
            color: widget.indicatorShadowColor ??
                Colors.blueAccent.withOpacity(.7),
            offset: Offset(0.0, .5),
            blurRadius: 3.0,
            spreadRadius: 0.3,
          ),
        ],
      ),
      child: ListView.builder(
        controller: dateIndicatorController,
        scrollDirection: Axis.horizontal,
        itemCount: monthDateCount, // to avoid showing zero
        itemBuilder: (BuildContext context, int index) {
          return _DateIndicatorInheritedWidget(
            date: date,
            selectedDay: selectedDay,
            monthDateCount: monthDateCount,
            isDateHolderActive: isDateHolderActive,
            activeHolders: widget.activeHolders,
            holderColor: widget.holderColor,
            activeBubbleColor: widget.activeBubbleColor,
            textColor: widget.textColor,
            numberColor: widget.numberColor,
            selectedBorderColor: widget.selectedBorderColor,
            unSelectedBorderColor: widget.unSelectedBorderColor,
            circleHolderWidth: widget.circleHolderWidth,
            circleHolderHeight: widget.circleHolderHeight,
            activeBubbleWidth: widget.activeBubbleWidth,
            activeBubbleHeight: widget.activeBubbleHeight,
            activeBubbleRightPosition: widget.activeBubbleRightPosition,
            activeBubbleLeftPosition: widget.activeBubbleLeftPosition,
            activeBubbleBottomPosition: widget.activeBubbleBottomPosition,
            hideDayOfWeek: widget.hideDayOfWeek,
            toggleDateHolderActive: toggleDateHolderActive,
            setSelectedDay: setSelectedDay,
            child: _DateHolder(
              index + 1,
              onTap: widget.onHolderTap,
            ),
          );
        },
      ),
    );
  }
}

class _DateHolder extends StatelessWidget {
  const _DateHolder(
    this.index, {
    this.onTap,
  });

  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final state = DateIndicator.of(context);

    final String dayOfWeek = DateFormat('EEEE')
        .format(DateTime(state.date.year, state.date.month, index))
        .substring(0, 1);

    return InkWell(
      onTap: () {
        state.toggleDateHolderActive(true);
        state.setSelectedDay(index);
        if (onTap != null) onTap(index);
      },
      child: Stack(
        children: <Widget>[
          buildDateHolder(dayOfWeek, context, state),
          (state.activeHolders?.contains(index) ?? false)
              ? activeBubble(state)
              : Container(),
        ],
      ),
    );
  }

  Widget activeBubble(state) {
    return Positioned(
      right: state.activeBubbleRightPosition,
      left: state.activeBubbleLeftPosition,
      bottom: state.activeBubbleBottomPosition,
      child: Container(
        width: state.activeBubbleWidth,
        height: state.activeBubbleHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: state.activeBubbleColor ?? Colors.deepOrangeAccent,
        ),
      ),
    );
  }

  Column buildDateHolder(String dayOfWeek, BuildContext context,
      _DateIndicatorInheritedWidget state) {
    return Column(
      children: <Widget>[
        !state.hideDayOfWeek
            ? Container(
                margin: const EdgeInsets.only(right: 5.0),
                child: Text(
                  "$dayOfWeek",
                  style: TextStyle(
                    color: state.textColor ?? Theme.of(context).primaryColor,
                    fontSize: 12.0,
                  ),
                ),
              )
            : SizedBox(),
        _CircleHolder(index: index),
      ],
    );
  }
}

class _CircleHolder extends StatelessWidget {
  const _CircleHolder({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final state = DateIndicator.of(context);
    return Container(
      width: state.circleHolderWidth,
      height: state.circleHolderHeight,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: state.holderColor ?? Colors.white,
        border: ((index == state.selectedDay) &&
                (state.isDateHolderActive == true))
            ? Border.all(
                width: 2.0,
                color:
                    state.selectedBorderColor ?? Theme.of(context).primaryColor,
              )
            : Border.all(
                color: state.unSelectedBorderColor ?? Colors.transparent),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            "$index", // to avoid showing zero
            style: TextStyle(
              color: state.numberColor ?? Theme.of(context).primaryColor,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
