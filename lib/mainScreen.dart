import 'package:flutter/material.dart';
import 'attendanceScreen.dart';

class MainScreen extends StatelessWidget {
  TextEditingController idController = TextEditingController();

  void showIdNotFoundError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ID Not Found'),
          content: Text('The entered ID does not exist.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
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
        title: Text('Main Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String userId = idController.text;
                if (userId.isNotEmpty) {
                  // Assuming the ID is valid, directly navigate to the AttendanceScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceScreen(userId: userId),
                    ),
                  );
                } else {
                  // Show an error message if the ID is empty
                  showIdNotFoundError(context);
                }
              },
              child: Text('Proceed to Attendance'),
            ),
          ],
        ),
      ),
    );
  }
}
