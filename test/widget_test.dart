import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(DeveloperWatchApp());
}

class DeveloperWatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DeveloperWatch(),
    );
  }
}

class DeveloperWatch extends StatefulWidget {
  @override
  _DeveloperWatchState createState() => _DeveloperWatchState();
}

class _DeveloperWatchState extends State<DeveloperWatch> {
  DateTime _currentTime = DateTime.now();
  Timer? _timer;
  String _time = '';
  String _date = '';
  String _day = '';
  String _month = '';
  String _year = '';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
        _updateTime();
      });
    });
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    _time = '${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}:${_currentTime.second.toString().padLeft(2, '0')}';
    _date = '${_currentTime.day.toString().padLeft(2, '0')}/${_currentTime.month.toString().padLeft(2, '0')}/${_currentTime.year.toString()}';
    _day = '${_getDayOfWeek(_currentTime.weekday)}';
    _month = '${_getMonth(_currentTime.month)}';
    _year = '${_currentTime.year.toString()}';
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Developer Watch'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _time,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                _date,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                _day,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                _month,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                _year,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
