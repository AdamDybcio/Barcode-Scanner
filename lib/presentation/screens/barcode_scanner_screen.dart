import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../presentation/widgets/scan_success_widget.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  late String code;
  String? _qrInfo = 'Zrób skan barkodu';
  bool _camState = false;

  _qrCallback(String? code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Skaner'),
      ),
      body: _camState
          ? Center(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: Stack(
                  children: [
                    QRBarScannerCamera(
                      onError: (context, error) => Text(
                        error.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      qrCodeCallback: (code) {
                        _qrCallback(code);
                      },
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 400),
                        child: Text(
                          'Zeskanuj barkod',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        strokeWidth: 3,
                        dashPattern: const [10, 10],
                        color: Colors.orange,
                        radius: const Radius.circular(20),
                        child: Container(
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ScanSuccess(
              qrInfo: _qrInfo.toString(),
            ),
    );
  }
}
