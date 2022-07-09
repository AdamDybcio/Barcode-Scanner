import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/barcode_list_cubit.dart';

class Barcodes extends StatelessWidget {
  const Barcodes({
    Key? key,
    required this.barcodes,
    required this.dates,
  }) : super(key: key);

  final List barcodes;
  final List dates;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
              confirmDismiss: (_) async {
                return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Icon(
                          Icons.warning,
                          color: Colors.redAccent,
                          size: 25,
                        ),
                        content: SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              const Text(
                                'Czy na pewno chcesz usunąć barkod? \n\n',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                barcodes[(barcodes.length - 1) - index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("ANULUJ")),
                          FlatButton(
                            onPressed: () {
                              BlocProvider.of<BarcodeListCubit>(context).remove(
                                (barcodes.length - 1) - index,
                              );
                              Navigator.of(context).pop(true);
                            },
                            child: const Text(
                              "USUŃ",
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
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
                      barcodes[(barcodes.length - 1) - index].length > 14
                          ? '${barcodes[(barcodes.length - 1) - index].substring(0, 14)}...'
                          : barcodes[(barcodes.length - 1) - index],
                    ),
                    Text(
                      dates[(barcodes.length - 1) - index],
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
    );
  }
}
