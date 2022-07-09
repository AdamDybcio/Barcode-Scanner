import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/barcode_list_cubit.dart';

class BarcodeList extends StatelessWidget {
  const BarcodeList({
    Key? key,
  }) : super(key: key);

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
            ? ListView.builder(
                itemCount: barcodes.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Dismissible(
                        background: const DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.delete,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          BlocProvider.of<BarcodeListCubit>(context).remove(
                            barcodes.indexOf(barcodes[index]),
                          );
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 3),
                              content: Text(
                                'Pomyślnie usunięto barkod: ${barcodes[index]}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                        key: UniqueKey(),
                        child: ListTile(
                          leading: const Icon(
                            Icons.qr_code_2,
                            size: 40,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                barcodes[index].length > 14
                                    ? '${barcodes[index].substring(0, 14)}...'
                                    : barcodes[index],
                              ),
                              Text(
                                dates[index],
                              ),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.swipe_left,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
              )
            : const Center(
                child: Text(
                  'Brak zeskanowanych barkodów!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      );
    });
  }
}
