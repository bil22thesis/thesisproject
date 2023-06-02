import 'package:flutter/material.dart';
import 'package:mediclient_application/nearest_pharmacy_page.dart';

class SideEffectsPage extends StatefulWidget {
  @override
  _SideEffectsPageState createState() => _SideEffectsPageState();
}

class _SideEffectsPageState extends State<SideEffectsPage> {
  List<String> sideEffects = [
    'Baş Ağrısı',
    'Mide Bulantısı',
    'Baş Dönmesi',
    'Halsizlik',
    'Ağız Kuruluğu',
  ];

  List<String> selectedSideEffects = [];

  void toggleSideEffect(String sideEffect) {
    setState(() {
      if (selectedSideEffects.contains(sideEffect)) {
        selectedSideEffects.remove(sideEffect);
      } else {
        selectedSideEffects.add(sideEffect);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yan Etkileri Seçin'),
      ),
      body: ListView.builder(
        itemCount: sideEffects.length,
        itemBuilder: (context, index) {
          final sideEffect = sideEffects[index];
          return ListTile(
            leading: Checkbox(
              value: selectedSideEffects.contains(sideEffect),
              onChanged: (value) {
                toggleSideEffect(sideEffect);
              },
            ),
            title: Text(sideEffect),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
        
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedSideEffectsPage(
                selectedSideEffects: selectedSideEffects,
              ),
            ),
          );
        },
        child: Text('Devam'),
      ),
    );
  }
}

class SelectedSideEffectsPage extends StatelessWidget {
  final List<String> selectedSideEffects;

  SelectedSideEffectsPage({required this.selectedSideEffects});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yan Etkileri Seçin'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: selectedSideEffects.length,
              itemBuilder: (context, index) {
                final sideEffect = selectedSideEffects[index];
                return ListTile(
                  title: Text(sideEffect),
                );
              },
            ),
          ),
          Column(children: [
            IconButton(
              icon: const Icon(
                Icons.medical_services,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NearestPharmacyPage(),
                  ),
                );
              },
            ),
            const Text(
              'En yakın Hastane',
              style: TextStyle(fontSize: 16),
            )
          ]),
        ],
      ),
    );
  }
}
