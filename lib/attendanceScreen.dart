import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  final String userId;

  AttendanceScreen({required this.userId});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool isSignedIn = false;
  DateTime? signInTime;
  DateTime? signOutTime;

  void signIn() {
    setState(() {
      isSignedIn = true;
      signInTime = DateTime.now();
    });
  }

  void signOut() {
    setState(() {
      isSignedIn = false;
      signOutTime = DateTime.now();
    });
    calculateHoursWorked();
  }

  void calculateHoursWorked() {
    if (signInTime != null && signOutTime != null) {
      Duration hoursWorked = signOutTime!.difference(signInTime!);
     
      print('Hours worked: ${hoursWorked.inHours} hours');
      showHoursWorkedDialog(hoursWorked.inHours);
    }
  }

  void showHoursWorkedDialog(int hoursWorked) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hours Worked'),
          content: Text('You worked for $hoursWorked hours.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, User ${widget.userId}'),
            SizedBox(height: 20),
            Text(
              isSignedIn
                  ? 'Status: Signed In'
                  : 'Status: Not Signed In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isSignedIn ? signOut : signIn,
              child: Text(isSignedIn ? 'Sign Out' : 'Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
