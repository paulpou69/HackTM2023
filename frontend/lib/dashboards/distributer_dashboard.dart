import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/config/state_handler.dart';
import 'package:frontend/popups/create_product.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/distributer_tag.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/inputs.dart';
import 'package:provider/provider.dart';

class DistributerDashboard extends StatefulWidget {
  const DistributerDashboard({super.key});

  @override
  State<DistributerDashboard> createState() => _DistributerDashboardState();
}

class _DistributerDashboardState extends State<DistributerDashboard> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> demoDistributerItems = [
      {
        'name': 'HackTM 2023',
        'stockQuantity': '20',
        'materials': [
          {"name": "Cotton", "producer": "Mihai", "quantity": "500"},
        ],
      },
      {
        'name': 'Nike Kicks',
        'stockQuantity': '20',
        'materials': [
          {"name": "Cotton", "producer": "Mihai", "quantity": "500"},
        ],
      },
      {
        'name': 'Bluza H&M',
        'stockQuantity': '20',
        'materials': [
          {"name": "Cotton", "producer": "Mihai", "quantity": "500"},
        ],
      },
    ];
    return Scaffold(
      backgroundColor: Color(0xFF6E8685),
      body: Stack(
        children: [
          SvgPicture.asset('assets/Subtract.svg'),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/Subtract2.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 135.0,
              right: 135.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Header(
                    address: Provider.of<StateHandler>(context, listen: false)
                        .userdata[0]['wallet_address'],
                    name: Provider.of<StateHandler>(context, listen: false)
                        .userdata[0]['name'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 48.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Manage as',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.0,
                              color: Color(0xFF000303),
                              fontFamily: 'BasierCircle',
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                            ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Brand',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      height: 1,
                                      color: Color(0xFF000303),
                                      fontFamily: 'ClashDisplay',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 56,
                                    ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Container(
                              color: background3,
                              child: CFTextField(
                                controller: TextEditingController(),
                                label: 'Search...',
                              ),
                            ),
                          ),
                          Container(
                            color: background3,
                            child: CFButton(
                              icon: 'assets/next.svg',
                              label: 'Add',
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CreateProductPopup();
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: demoDistributerItems
                          .map((task) => SizedBox(
                                width: 370,
                                height: 370,
                                child: DistributerTag(
                                  name: task['name'],
                                  stockQuantity: task['stockQuantity'],
                                  materials: task['materials'],
                                ),
                              ))
                          .toList(growable: false),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
