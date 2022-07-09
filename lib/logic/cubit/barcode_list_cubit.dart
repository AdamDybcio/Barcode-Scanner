import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'barcode_list_state.dart';

class BarcodeListCubit extends Cubit<BarcodeListState> with HydratedMixin {
  BarcodeListCubit()
      : super(
          const BarcodeListState(barcodes: [], dates: []),
        );

  Future<void> add(String barcode) async {
    List<String> barcodes = [];
    List<String> dates = [];

    state.barcodes.forEach((element) {
      barcodes.add(element);
    });
    state.dates.forEach((element) {
      dates.add(element);
    });

    if (!state.barcodes.contains(barcode)) {
      barcodes.add(barcode);
      dates.add(DateFormat('dd.MM.yyyy').format(DateTime.now()));
    }

    emit(BarcodeListState(
      barcodes: barcodes,
      dates: dates,
    ));
  }

  Future<void> remove(int index) async {
    List<String> barcodes = [];
    List<String> dates = [];

    state.barcodes.forEach((element) {
      barcodes.add(element);
    });
    state.dates.forEach((element) {
      dates.add(element);
    });

    barcodes.removeAt(index);
    dates.removeAt(index);

    emit(BarcodeListState(
      barcodes: barcodes,
      dates: dates,
    ));
  }

  @override
  BarcodeListState? fromJson(Map<String, dynamic> json) {
    return BarcodeListState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(BarcodeListState state) {
    return state.toMap();
  }
}
