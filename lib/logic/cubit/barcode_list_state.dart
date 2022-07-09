part of 'barcode_list_cubit.dart';

class BarcodeListState extends Equatable {
  final List barcodes;
  final List dates;

  const BarcodeListState({required this.barcodes, required this.dates});

  @override
  List<Object> get props => [barcodes, dates];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'barcodes': barcodes,
      'dates': dates,
    };
  }

  factory BarcodeListState.fromMap(Map<String, dynamic> map) {
    return BarcodeListState(
      barcodes: map['barcodes'] as List<String>,
      dates: map['dates'] as List<String>,
    );
  }

  String toJson() => json.encode(toMap());

  factory BarcodeListState.fromJson(String source) =>
      BarcodeListState.fromMap(json.decode(source) as Map<String, dynamic>);
}
