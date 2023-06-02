import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barkod Tarayıcı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Barkod Tara'),
              onPressed: () async {
                String barcodeResult = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666',
                  'İptal',
                  false,
                  ScanMode.DEFAULT,
                );

                if (barcodeResult != '-1') {
                  print('Taranan Barkod: $barcodeResult');
                } else {
                  print('Barkod Tarama İptal Edildi');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
