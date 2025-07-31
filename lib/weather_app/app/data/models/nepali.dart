import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

Future<void> pickNepaliDateRange(BuildContext context) async {
  final DateTimeRange? pickedRange = await showNepaliDateRangePicker(
    context: context,
    firstDate: NepaliDateTime(2000),
    lastDate: NepaliDateTime(2090),
    initialDateRange: DateTimeRange(
      start: NepaliDateTime.now().subtract(const Duration(days: 7)),
      end: NepaliDateTime.now(),
    ),
  );

  if (pickedRange != null) {
    final NepaliDateFormat formatter = NepaliDateFormat("yyyy-MM-dd");
    final start = formatter.format(pickedRange.start as NepaliDateTime);
    final end = formatter.format(pickedRange.end as NepaliDateTime);
    print("Selected range: $start to $end");
  } else {
    print("No range selected.");
  }
}
