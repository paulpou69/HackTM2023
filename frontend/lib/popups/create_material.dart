import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/inputs.dart';

class CreateMaterialPopup extends StatefulWidget {
  const CreateMaterialPopup({super.key});

  @override
  State<CreateMaterialPopup> createState() => _CreateMaterialPopupState();
}

final materialname = TextEditingController();
final contractaddress = TextEditingController();

class _CreateMaterialPopupState extends State<CreateMaterialPopup> {
  List<String> demoCertifications = [
    'FSC',
    'BSG',
    'FairTrade',
    'FSC',
    'BSG',
    'FairTrade',
    'FSC',
    'BSG',
    'FairTrade',
    'FSC',
    'BSG',
    'FairTrade',
    'FSC',
    'BSG',
    'FairTrade',
    'FSC',
    'BSG',
    'FairTrade',
    'FSC',
    'BSG',
    'FairTrade',
    'FSC',
    'BSG',
    'FairTrade'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 769,
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
                    'Create',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Material Name',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1,
                                      color: text,
                                      fontFamily: 'BasierCircle',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        SizedBox(
                          width: 338,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: CFTextField(
                              controller: materialname,
                              label: 'Input data...',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Add Certification',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1,
                                      color: text,
                                      fontFamily: 'BasierCircle',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        SizedBox(
                          width: 338,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: CFTextField(
                              controller: materialname,
                              label: 'Input address...',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Contract Address',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1,
                                      color: text,
                                      fontFamily: 'BasierCircle',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        SizedBox(
                          width: 338,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: CFTextField(
                              controller: contractaddress,
                              label: 'Input data...',
                            ),
                          ),
                        ),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Certification List',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1,
                                      color: text,
                                      fontFamily: 'BasierCircle',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        SizedBox(
                          width: 338,
                          height: 126,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: primary,
                                width: 1.5,
                              ),
                              color: Color(0xFF000303),
                            ),
                            child: SingleChildScrollView(
                              child: SizedBox(
                                width: 338,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children: demoCertifications
                                        .map(
                                          (certification) => Container(
                                            decoration: BoxDecoration(
                                              color: Color(0x7A00D8D6),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    certification,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          height: 1,
                                                          color:
                                                              Color(0xFFF3FFFF),
                                                          fontFamily:
                                                              'BasierCircle',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                  SvgPicture.asset(
                                                      'assets/close_small.svg'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(growable: false),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
