import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/dropdown.dart';
import 'package:frontend/widgets/inputs.dart';

class CreateProductPopup extends StatefulWidget {
  const CreateProductPopup({super.key});

  @override
  State<CreateProductPopup> createState() => _CreateProductPopupState();
}

int currentTab = 0;

final name = TextEditingController();
final stock = TextEditingController();

List<dynamic> selectedMaterials = [
  {
    "name": "Cotton",
    "quantity": "500",
  }
];

List<String> availableMaterials = ["Cotton", "Silk", "Polyester"];

class _CreateProductPopupState extends State<CreateProductPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 630,
          height: currentTab == 1 ? 660 : 434,
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    'Product',
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
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              currentTab = 0;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: currentTab == 0
                                    ? primary
                                    : Color(0xFF000303),
                                border: Border.all(color: primary, width: 1.5),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Center(
                                  child: Text(
                                    'General',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          height: 1,
                                          color: currentTab == 0
                                              ? Color(0xFF000303)
                                              : Color(0xFFF3FFFF),
                                          fontFamily: 'BasierCircle',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              currentTab = 1;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: currentTab == 1
                                    ? primary
                                    : Color(0xFF000303),
                                border: Border.all(color: primary, width: 1.5),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  child: Text(
                                    'Materials',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          height: 1,
                                          color: currentTab == 1
                                              ? Color(0xFF000303)
                                              : Color(0xFFF3FFFF),
                                          fontFamily: 'BasierCircle',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (currentTab == 0) ...[
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
                              'Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    height: 1,
                                    color: text,
                                    fontFamily: 'BasierCircle',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          SizedBox(
                            width: 275,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: CFTextField(
                                controller: name,
                                label: 'Input name...',
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
                              'Stock',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    height: 1,
                                    color: text,
                                    fontFamily: 'BasierCircle',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          SizedBox(
                            width: 275,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: CFTextField(
                                controller: stock,
                                label: 'Input stock...',
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ] else if (currentTab == 1) ...[
                  for (dynamic selectedMaterial in selectedMaterials) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Material',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      height: 1,
                                      color: text,
                                      fontFamily: 'BasierCircle',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 275,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(bottom: 24.0),
                            //     child: CFTextField(
                            //       controller: TextEditingController(
                            //           text: selectedMaterial['name']),
                            //       label: 'Input material...',
                            //     ),
                            //   ),
                            // ),
                            CFDropDown(
                              items: availableMaterials,
                              value: selectedMaterial['name'],
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
                                'Quantity',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      height: 1,
                                      color: text,
                                      fontFamily: 'BasierCircle',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                              ),
                            ),
                            SizedBox(
                              width: 275,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: CFTextField(
                                  controller: TextEditingController(
                                      text: selectedMaterial['quantity']),
                                  label: 'Input stock...',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          color: Color(0xFF71737B),
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Add Material',
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
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            selectedMaterials.add(
                              {
                                "name": "",
                                "quantity": "",
                              },
                            );
                            setState(() {});
                          },
                          child: Container(
                            width: 275,
                            height: 48,
                            color: primary,
                            child: Center(
                              child: SvgPicture.asset('assets/Plus.svg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
