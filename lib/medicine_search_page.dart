import 'package:flutter/material.dart';
import 'package:mediclient_application/medicine_details_page.dart';
import 'package:mediclient_application/medicines.dart';

class MedicineSearchPage extends StatefulWidget {
  MedicineSearchPage();

  @override
  _MedicineSearchPageState createState() => _MedicineSearchPageState();
}

class _MedicineSearchPageState extends State<MedicineSearchPage> {
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
        title: Text('İlaçlar'),
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
              decoration: const InputDecoration(
                labelText: 'Ara',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMedicineList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicineDetailsPage(
                          medicine: filteredMedicineList[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            filteredMedicineList[index].name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          filteredMedicineList[index].shortDescription,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Medicine {
  final String name;
  final String description;
  final String shortDescription;

  Medicine(
      {required this.name,
      required this.description,
      required this.shortDescription});
}
