import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class ParamGraph extends StatefulWidget {
  final String paramtype;
  final String millID;

  const ParamGraph({
    Key? key,
    required this.paramtype,
    required this.millID,
  }) : super(key: key);

  @override
  _ParamGraphState createState() => _ParamGraphState();
}

class _ParamGraphState extends State<ParamGraph> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  List<ChartData> getDataSource() {
    // Assume the data is in UTC time zone
    final now = DateTime.now().toUtc(); // Get current time in UTC
    return [
      ChartData(now.subtract(const Duration(hours: 4)), 50, 45, 40, 48),
      ChartData(now.subtract(const Duration(hours: 3)), 60, 55, 50, 58),
      ChartData(now.subtract(const Duration(hours: 2)), 70, 65, 60, 68),
      ChartData(now.subtract(const Duration(hours: 1)), 80, 75, 70, 78),
      ChartData(now, 90, 85, 80, 88),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.millID} - ${widget.paramtype}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${selectedDay.day}/${selectedDay.month}/${selectedDay.year}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SfCartesianChart(
              title: ChartTitle(text: widget.paramtype),
              legend: const Legend(isVisible: true),
              primaryXAxis:
                  const DateTimeAxis(), // Ensure this is configured to use DateTime
              series: <CartesianSeries>[
                LineSeries<ChartData, DateTime>(
                  name: 'Max',
                  dataSource: getDataSource(),
                  xValueMapper: (ChartData data, _) =>
                      data.time, // xValueMapper to DateTime
                  yValueMapper: (ChartData data, _) => data.max,
                  color: Colors.blue,
                ),
                LineSeries<ChartData, DateTime>(
                  name: 'Average',
                  dataSource: getDataSource(),
                  xValueMapper: (ChartData data, _) =>
                      data.time, // xValueMapper to DateTime
                  yValueMapper: (ChartData data, _) => data.average,
                  color: Colors.orange,
                ),
                LineSeries<ChartData, DateTime>(
                  name: 'Min',
                  dataSource: getDataSource(),
                  xValueMapper: (ChartData data, _) =>
                      data.time, // xValueMapper to DateTime
                  yValueMapper: (ChartData data, _) => data.min,
                  color: Colors.green,
                ),
                LineSeries<ChartData, DateTime>(
                  name: 'Threshold',
                  dataSource: getDataSource(),
                  xValueMapper: (ChartData data, _) =>
                      data.time, // xValueMapper to DateTime
                  yValueMapper: (ChartData data, _) => data.threshold,
                  color: Colors.red,
                  dashArray: const <double>[5, 5],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.now(),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final DateTime time;
  final double max;
  final double average;
  final double min;
  final double threshold;

  ChartData(this.time, this.max, this.average, this.min, this.threshold);
}
