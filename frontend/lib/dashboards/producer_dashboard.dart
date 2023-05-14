import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/config/state_handler.dart';
import 'package:frontend/popups/create_material.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/inputs.dart';
import 'package:frontend/widgets/producer_tag.dart';
import 'package:provider/provider.dart';

class ProducerDashboard extends StatefulWidget {
  const ProducerDashboard({super.key});

  @override
  State<ProducerDashboard> createState() => _ProducerDashboardState();
}

class _ProducerDashboardState extends State<ProducerDashboard> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> demoProducerItems = [
      {
        'name': 'Bumbac',
        'address': '0xa610v13b13',
      },
      {
        'name': 'Silk',
        'address': '0x1234',
      },
      {
        'name': 'Bumbac2',
        'address': '0x1234556',
      }
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
                            'Producer',
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
                              icon: 'assets/plus.svg',
                              label: 'Create',
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CreateMaterialPopup();
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: demoProducerItems
                        .map((task) => SizedBox(
                              width: 370,
                              height: 277,
                              child: ProducerTag(
                                name: task['name'],
                                address: task['address'],
                              ),
                            ))
                        .toList(growable: false),
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
