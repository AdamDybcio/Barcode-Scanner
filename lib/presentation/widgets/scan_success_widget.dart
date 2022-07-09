import 'package:flutter/material.dart';

import '../../presentation/widgets/success_buttons_widget.dart';

class ScanSuccess extends StatefulWidget {
  final String qrInfo;
  const ScanSuccess({Key? key, required this.qrInfo}) : super(key: key);

  @override
  State<ScanSuccess> createState() => _ScanSuccessState();
}

class _ScanSuccessState extends State<ScanSuccess> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(5, 5),
              blurRadius: 3,
            ),
          ],
          color: Colors.orange,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Sukces!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                  fontSize: 30,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Udało Ci się zeskanować barkod:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.yellowAccent,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: Colors.yellowAccent,
                    width: 2,
                  ),
                  left: BorderSide(
                    color: Colors.yellowAccent,
                    width: 2,
                  ),
                  right: BorderSide(
                    color: Colors.yellowAccent,
                    width: 2,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      widget.qrInfo,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Czy chcesz go zapisać?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SuccessButtons(widget: widget),
          ],
        ),
      ),
    );
  }
}
