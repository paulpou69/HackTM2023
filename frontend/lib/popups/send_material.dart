import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/inputs.dart';

class SendMaterialPopup extends StatefulWidget {
  final String contractAddress;
  const SendMaterialPopup({super.key, required this.contractAddress});

  @override
  State<SendMaterialPopup> createState() => _SendMaterialPopupState();
}

final quantity = TextEditingController();
final address = TextEditingController();

class _SendMaterialPopupState extends State<SendMaterialPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 430,
          height: 447,
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
                    'Send',
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
                    'Material',
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
                    'Quantity',
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
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: CFTextField(
                    controller: quantity,
                    label: 'Input quantity...',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Receiver Address',
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
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: CFTextField(
                    controller: address,
                    label: 'Input address...',
                  ),
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    CFButton(
                        icon: 'assets/next.svg', label: 'Send', onTap: () {}),
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
