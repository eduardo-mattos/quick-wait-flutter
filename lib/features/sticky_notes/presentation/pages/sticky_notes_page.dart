import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quick_wait_android/commons/config/calendar.dart';
import 'package:quick_wait_android/design_system/buttons/circular_button.dart';
import 'package:table_calendar/table_calendar.dart';

class StickyNotesPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const StickyNotesPage() : super();

  @override
  _StickyNotesPageState createState() => _StickyNotesPageState();
}

class _StickyNotesPageState extends State<StickyNotesPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#E4FDFF"),
        body: Column(
          children: [
            Positioned(
              top: 10,
              left: 30,
              child: CircularButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  Modular.to.pop();
                },
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 70, bottom: 8),
              child: Text(
                'Lembretes',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF12A1A7),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 15.0, top: 10, bottom: 0),
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: (TableCalendar(
                    rowHeight: 40,
                    locale: 'pt_BR',
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'mês',
                      CalendarFormat.week: 'semana',
                      CalendarFormat.twoWeeks: '2 semanas',
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ))
                  ),
            ),
          ],
        ));
  }
}
