import 'package:flutter/material.dart';
import 'package:mediclient_application/medicine_search_page.dart';
import 'package:mediclient_application/nearest_pharmacy_page.dart';
import 'package:mediclient_application/search_medicine_page.dart';
import 'package:mediclient_application/barcode_scanner_page.dart';
import 'package:mediclient_application/side_effects_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                image: AssetImage('assets/MediclientLogo.png'), height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.medical_services,
                              size: 40,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MedicineSearchPage(),
                                ),
                              );
                            },
                          ),
                          const Text(
                            'İlaç Ara',
                            style: TextStyle(fontSize: 16),
                          )
                        ]),
                    Column(children: [
                      IconButton(
                        icon: const Icon(
                          Icons.psychology_alt,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SideEffectsPage(),
                            ),
                          );
                        },
                      ),
                      const Text(
                        'Doktora Gitmeli Miyim?',
                        style: TextStyle(fontSize: 16),
                      )
                    ]),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      IconButton(
                        icon: const Icon(
                          Icons.note_add,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchMedicinePage(),
                            ),
                          );
                        },
                      ),
                      const Text(
                        'Kullanmaya Başla',
                        style: TextStyle(fontSize: 16),
                      )
                    ]),
                    Column(children: [
                      IconButton(
                        icon: const Icon(
                          Icons.qr_code,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BarcodeScannerPage(),
                            ),
                          );
                        },
                      ),
                      const Text(
                        'Barkod Tara',
                        style: TextStyle(fontSize: 16),
                      )
                    ]),
                  ],
                ),
              ],
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
                'En Yakın Sağlık Kuruluşu',
                style: TextStyle(fontSize: 16),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
