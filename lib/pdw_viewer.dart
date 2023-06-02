import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class PDFViewer extends StatefulWidget {
  final String pdfPath;

  PDFViewer({required this.pdfPath});

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF'),
      ),
      body: Center(
        child: PdfView(
          path: widget.pdfPath,
        ),
      ),
    );
  }
}
