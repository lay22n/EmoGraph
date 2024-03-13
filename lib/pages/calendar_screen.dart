import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'dart:math';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _isYearlyView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Emotion Analysis Calendar',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(), // Add spacer to push buttons to the right edge of the screen
            Container(
              height: 35, // Adjust the height as needed
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                selectedColor: Colors.white, // Selected text color
                color: Color(0xDDA15E)
                    .withOpacity(0.75), // Not selected text color
                fillColor: Color(0xFFBC6C25), // Background color when selected
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Monthly',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Yearly',
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    _isYearlyView = index == 1;

                    // Reset _focusedDay and _selectedDay when switching back to monthly view
                    if (!_isYearlyView) {
                      _focusedDay = DateTime.now();
                      _selectedDay = null;
                    }
                  });
                },
                isSelected: _isYearlyView ? [false, true] : [true, false],
              ),
            ),
            SizedBox(
                width:
                    60), // Add space between the toggle buttons and logout button
            TextButton(
              onPressed: () {
                // Implement logout functionality
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFBC6C25),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            container (
              width: 1450.0,
          height: 900.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Background.jpg',
              ).image,
            ),
          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicatorCircle(
                      Color(0xFFCFE1B9), 'Relaxed Days/Months'),
                  SizedBox(width: 20),
                  _buildIndicatorCircle(
                      Color(0xDDDD8282), 'Stressed Days/Months'),
                ],
              ),
            ),
            if (_isYearlyView) ..._buildYearlyView(),
            if (!_isYearlyView) _buildMonthlyView(),
            SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorCircle(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMonthlyView() {
    final List<Color> colors = List.generate(12, (index) {
      return Random().nextBool() ? Color(0xFFCFE1B9) : Color(0xDDDD8282);
    });

    return TableCalendar(
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: {
        CalendarFormat.month: 'Month', // Only the monthly view is available
      },
      focusedDay: _focusedDay,
      firstDay: DateTime.now().subtract(Duration(days: 365)),
      lastDay: DateTime.now().add(Duration(days: 365)),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return _buildDayCell(day);
        },
      ),
      headerStyle: HeaderStyle(
        titleCentered: true,
      ),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  List<Widget> _buildYearlyView() {
    final year = _focusedDay.year;
    final random =
        Random(year); // Use the year as a seed for the random number generator

    // Define the two colors
    final color1 = Color(0xFFCFE1B9);
    final color2 = Color(0xDDDD8282);

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0), // Add padding to the left
            child: SizedBox(
              width:
                  40, // Adjust the width of the SizedBox to control the size of the IconButton
              child: IconButton(
                iconSize: 15, // Adjust the size of the icon
                icon: Icon(Icons
                    .arrow_back_ios), // Use arrow_back_ios icon for the back button
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(_focusedDay.year - 1);
                  });
                },
              ),
            ),
          ),
          Text(
            ' $year ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 10.0), // Add padding to the right
            child: SizedBox(
              width:
                  40, // Adjust the width of the SizedBox to control the size of the IconButton
              child: IconButton(
                iconSize: 15, // Adjust the size of the icon
                icon: Icon(Icons
                    .arrow_forward_ios), // Use arrow_forward_ios icon for the forward button
                onPressed: _focusedDay.year == DateTime.now().year
                    ? null
                    : () {
                        setState(() {
                          _focusedDay = DateTime(_focusedDay.year + 1);
                        });
                      },
                color: _focusedDay.year == DateTime.now().year
                    ? Colors.grey
                    : null,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
      Column(
        // Center the list of months
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(12, (index) {
          DateTime month = DateTime(year, index + 1, 1);
          final randomColor = Random(month.month).nextBool() ? color1 : color2;

          return Container(
            margin: EdgeInsets.symmetric(vertical: 4), // Add margin for spacing
            width: 200, // Adjust the width of the container
            height: 40, // Adjust the height of the container
            decoration: BoxDecoration(
              color: randomColor,
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: Center(
              // Center the text horizontally and vertically
              child: Text(
                DateFormat('MMMM').format(month), // Format month name
                style: TextStyle(
                  color: Colors.white, // White text color
                  fontSize: 16, // Adjust the font size
                ),
              ),
            ),
          );
        }),
      ),
    ];
  }

  Widget _buildDayCell(DateTime day) {
    final randomColor =
        Random(day.day).nextBool() ? Color(0xFFCFE1B9) : Color(0xDDDD8282);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: randomColor,
      ),
      child: Center(
        child: Text(
          day.day.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
