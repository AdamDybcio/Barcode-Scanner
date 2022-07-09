import 'package:flutter/material.dart';

import '../widgets/start_scanning_button_widget.dart';
import '../widgets/barcode_list_widget.dart';

class BarcodeListScreen extends StatefulWidget {
  const BarcodeListScreen({Key? key}) : super(key: key);

  @override
  State<BarcodeListScreen> createState() => _BarcodeListScreenState();
}

class _BarcodeListScreenState extends State<BarcodeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Twoje barkody',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(0.5, 0.5),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            BarcodeList(),
            Padding(
              padding: EdgeInsets.all(10),
              child: ScanButton(),
            ),
          ],
        ),
      ),
    );
  }
}
