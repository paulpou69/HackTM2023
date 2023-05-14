import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/inputs.dart';

class AddStockPopup extends StatefulWidget {
  final String contractAddress;
  final String name;
  const AddStockPopup(
      {super.key, required this.contractAddress, required this.name});

  @override
  State<AddStockPopup> createState() => _AddStockPopupState();
}

final quantity = TextEditingController();

class _AddStockPopupState extends State<AddStockPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 371,
          height: 346,
          decoration: BoxDecoration(
            color: Color(0xFF000303),
            border: Border.all(
              color: Color(0xFFF3FFFF),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Add Stock',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1,
                          color: primary,
                          fontFamily: 'BasierCircle',
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1,
                          color: text,
                          fontFamily: 'ClashDisplay',
                          fontWeight: FontWeight.w600,
                          fontSize: 56,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Stock',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1,
                          color: text,
                          fontFamily: 'BasierCircle',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: CFTextField(
                    controller: quantity,
                    label: 'Input quantity...',
                  ),
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    CFButton(
                        icon: 'assets/next.svg', label: 'Finish', onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
