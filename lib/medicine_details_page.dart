import 'package:flutter/material.dart';
import 'package:mediclient_application/medicine_search_page.dart';
import 'package:mediclient_application/pdw_viewer.dart';

class MedicineDetailsPage extends StatelessWidget {
  final Medicine medicine;

  MedicineDetailsPage({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicine.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'İlaç: ${medicine.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFViewer(
                        pdfPath:
                            'https://titck.gov.tr/storage/Archive/2022/kubKtAttachments/kt_a84754bd-f403-4824-8ffd-326d15f906cf.pdf'),
                  ),
                );
              },
              child: const Text(
                'Prospektüs PDF',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Geri'),
            ),
          ],
        ),
      ),
    );
  }
}
