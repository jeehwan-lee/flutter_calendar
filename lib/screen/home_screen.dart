import 'package:calendar_app/component/main_calendar.dart';
import 'package:calendar_app/component/schedule_bottom_sheet.dart';
import 'package:calendar_app/component/schedule_card.dart';
import 'package:calendar_app/component/today_banner.dart';
import 'package:calendar_app/const/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => const ScheduleBottomSheet(),
            isScrollControlled: true,
            isDismissible: true,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: onDaySelected,
            ),
            const SizedBox(
              height: 8,
            ),
            TodayBanner(selectedDate: selectedDate, count: 0),
            const SizedBox(
              height: 8,
            ),
            const ScheduleCard(startTime: 12, endTime: 14, content: '프로그래밍 공부'),
          ],
        ),
      ),
    );
  }
}
