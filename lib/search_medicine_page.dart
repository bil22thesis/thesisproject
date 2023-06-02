// search_medicine_page.dart

import 'package:flutter/material.dart';
import 'package:mediclient_application/medicine_search_page.dart';
import 'package:mediclient_application/select_details_page.dart';
import 'package:mediclient_application/medicines.dart';

class SearchMedicinePage extends StatefulWidget {
  SearchMedicinePage();

  @override
  _SearchMedicinePageState createState() => _SearchMedicinePageState();
}

class _SearchMedicinePageState extends State<SearchMedicinePage> {
  String searchQuery = '';
  List<Medicine> filteredMedicineList = [];

  @override
  void initState() {
    super.initState();
    filteredMedicineList = medicineList;
  }

  void filterMedicines() {
    setState(() {
      filteredMedicineList = medicineList
          .where((medicine) =>
              medicine.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İlaç Ara'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                searchQuery = value;
                filterMedicines();
              },
              decoration: InputDecoration(
                labelText: 'Ara',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMedicineList.length,
              itemBuilder: (context, index) {
                final medicine = filteredMedicineList[index];
                return ListTile(
                  title: Text(medicine.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectDetailsPage(
                          selectedMedicine: medicine.name,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
