import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/inputs.dart';

class CertifyMaterialPopup extends StatefulWidget {
  const CertifyMaterialPopup({super.key});

  @override
  State<CertifyMaterialPopup> createState() => _CertifyMaterialPopupState();
}

class _CertifyMaterialPopupState extends State<CertifyMaterialPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 670,
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Certify',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1,
                          color: primary,
                          fontFamily: 'BasierCircle',
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                  ),
                ),
                Text(
                  'Material',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1,
                        color: text,
                        fontFamily: 'ClashDisplay',
                        fontWeight: FontWeight.w600,
                        fontSize: 56,
                      ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Material Name',
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
                    controller: TextEditingController(),
                    label: 'Input data...',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Contract Address',
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
                    controller: TextEditingController(),
                    label: 'Input data...',
                  ),
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    CFButton(
                      icon: 'assets/plus.svg',
                      label: 'Finish',
                      onTap: () {},
                    ),
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
