// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class DisplayRangeCalendar extends StatefulWidget {
  const DisplayRangeCalendar({
    super.key,
    this.width,
    this.height,
    required this.dateList,
  });

  final double? width;
  final double? height;
  final List<DateTime> dateList;

  @override
  State<DisplayRangeCalendar> createState() => _DisplayRangeCalendarState();
}

class _DisplayRangeCalendarState extends State<DisplayRangeCalendar> {
  late DateTime _focusedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _processDates();
  }

  @override
  void didUpdateWidget(covariant DisplayRangeCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.dateList != oldWidget.dateList) {
      _processDates();
    }
  }

  // Normalize: Strip time so dates match perfectly (2025-11-21 00:00:00)
  DateTime _normalizeDate(DateTime date) {
    return DateTime.utc(date.year, date.month, date.day);
  }

  void _processDates() {
    _focusedDay = DateTime.now();

    if (widget.dateList.isNotEmpty) {
      Set<DateTime> uniqueDates =
          widget.dateList.map((d) => _normalizeDate(d)).toSet();
      List<DateTime> sortedDates = uniqueDates.toList()..sort();

      if (sortedDates.isNotEmpty) {
        _rangeStart = sortedDates.first;
        _rangeEnd = sortedDates.last;
        _focusedDay = _rangeEnd!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryOrange = Color(0xFFF97315);
    final Color lightOrange = Color(0x4DF97315);
    final Color textDark = Color(0xFF333333);

    return Container(
      width: widget.width,
      // IMPORTANT: If widget.height is passed as 'inf' or is too small,
      // the calendar will clip. We use a constraint to ensure at least enough space.
      constraints: BoxConstraints(
        minHeight: 380.0, // Ensure enough space for 6 weeks
        maxHeight: widget.height ?? double.infinity,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        rowHeight: 48.0, // Fix row height to prevent layout jumping

        // Range Logic
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        rangeSelectionMode: RangeSelectionMode.enforced,

        // Lock the format to Month only
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },

        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            color: Color(0xFF3E4958),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          leftChevronIcon: Icon(Icons.chevron_left, color: Color(0xFF3E4958)),
          rightChevronIcon: Icon(Icons.chevron_right, color: Color(0xFF3E4958)),
        ),

        calendarStyle: CalendarStyle(
          // FIX 1: Remove margins so the range creates a solid strip
          cellMargin: EdgeInsets.zero,

          rangeHighlightColor: lightOrange,

          // Start of Range (Left Side)
          rangeStartDecoration: BoxDecoration(
            color: lightOrange,
            shape: BoxShape.rectangle,
          ),
          rangeStartTextStyle: TextStyle(color: textDark, fontSize: 16),

          // End of Range (Right Side - Dark Box)
          rangeEndDecoration: BoxDecoration(
            color: primaryOrange,
            shape: BoxShape.rectangle,
            // Only round the corners of the "End" box slightly
            borderRadius: BorderRadius.circular(0),
          ),
          rangeEndTextStyle: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),

          // Default Text
          defaultTextStyle: TextStyle(color: textDark, fontSize: 16),
          weekendTextStyle: TextStyle(color: textDark, fontSize: 16),
          outsideTextStyle: TextStyle(color: Colors.grey, fontSize: 16),

          // Hide the default "Today" circle if it conflicts
          todayDecoration: BoxDecoration(color: Colors.transparent),
          todayTextStyle:
              TextStyle(color: primaryOrange, fontWeight: FontWeight.bold),
        ),

        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
