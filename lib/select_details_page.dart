// medicine_details_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SelectDetailsPage extends StatefulWidget {
  final String selectedMedicine;

  SelectDetailsPage({required this.selectedMedicine});

  @override
  _SelectDetailsPageState createState() => _SelectDetailsPageState();
}

class _SelectDetailsPageState extends State<SelectDetailsPage> {
  int timesPerDay = 1;
  TimeOfDay? firstMedicationTime;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void startMedication() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kullanım Detayı'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Günde Kaç Kere:'),
              DropdownButton<int>(
                value: timesPerDay,
                items: <int>[1, 2, 3, 4, 5].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    timesPerDay = newValue ?? 1;
                  });
                },
              ),
              SizedBox(height: 16),
              Text('İlk Kullanım Saati'),
              TextButton(
                child: Text(
                  firstMedicationTime != null
                      ? firstMedicationTime!.format(context)
                      : 'Zaman Seç',
                ),
                onPressed: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    setState(() {
                      firstMedicationTime = selectedTime;
                    });
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Kullanmaya Başla'),
              onPressed: () {
                Navigator.pop(context);
              },
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
        title: Text('Kullanım Detayları'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seçilen İlaç: ${widget.selectedMedicine}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Kullanmaya Başla'),
              onPressed: startMedication,
            ),
          ],
        ),
      ),
    );
  }
}
