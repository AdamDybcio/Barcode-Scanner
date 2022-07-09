import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/barcode_list_cubit.dart';
import './empty_barcode_list.dart';
import './barcodes_widget.dart';

class BarcodeList extends StatefulWidget {
  const BarcodeList({
    Key? key,
  }) : super(key: key);

  @override
  State<BarcodeList> createState() => _BarcodeListState();
}

class _BarcodeListState extends State<BarcodeList> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final barcodes = context.select(
        (BarcodeListCubit cubit) => cubit.state.barcodes,
      );
      final dates = context.select(
        (BarcodeListCubit cubit) => cubit.state.dates,
      );
      return Expanded(
        child: barcodes.isNotEmpty
            ? Barcodes(barcodes: barcodes, dates: dates)
            : const EmptyBarcodeList(),
      );
    });
  }
}
