import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/config/state_handler.dart';
import 'package:frontend/popups/certify_material.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/certifier_tag.dart';
import 'package:frontend/widgets/header.dart';
import 'package:frontend/widgets/inputs.dart';
import 'package:provider/provider.dart';

class CertifierDashboard extends StatefulWidget {
  const CertifierDashboard({super.key});

  @override
  State<CertifierDashboard> createState() => _CertifierDashboardState();
}

List<dynamic> demoDistributerItems = [];

class _CertifierDashboardState extends State<CertifierDashboard> {
  Future<void> thing() async {
    dynamic request = await api.getCertifiedMaterials(
        address: Provider.of<StateHandler>(context, listen: false).userdata[0]
            ['contract_address']);
    demoDistributerItems = request['certified'];
    setState(() {});
  }

  @override
  void initState() {
    thing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                            'Certifier',
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
                                    return const CertifyMaterialPopup();
                                  },
                                );
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
                    children: demoDistributerItems
                        .map((task) => SizedBox(
                              width: 370,
                              height: 277,
                              child: CertifierTag(
                                name: task['name'],
                                address: task['contract_address'],
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
