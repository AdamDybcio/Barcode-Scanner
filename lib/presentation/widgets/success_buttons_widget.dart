import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/barcode_list_cubit.dart';
import '../screens/barcode_scanner_screen.dart';
import './scan_success_widget.dart';

class SuccessButtons extends StatelessWidget {
  const SuccessButtons({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ScanSuccess widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlatButton(
          color: Colors.redAccent,
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((context) => const BarcodeScanner()),
              ),
            );
          },
          child: const Text('ANULUJ'),
        ),
        FlatButton(
          color: Colors.greenAccent,
          onPressed: () async {
            BlocProvider.of<BarcodeListCubit>(context).add(widget.qrInfo);

            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: ((context) => const BarcodeScanner())));
          },
          child: const Text('ZAPISZ'),
        ),
      ],
    );
  }
}
