import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/dashboards/certifier_dashboard.dart';
import 'package:frontend/dashboards/distributer_dashboard.dart';
import 'package:frontend/dashboards/producer_dashboard.dart';

class Homescreen extends StatefulWidget {
  final String userType;
  const Homescreen({
    super.key,
    required this.userType,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: background1,
    //   body: Row(
    //     children: [],
    //   ),
    // );
    if (widget.userType.isEmpty) {
      return Scaffold(
        backgroundColor: background1,
        body: Center(
          child: Text('userType not provided, quitting.'),
        ),
      );
    } else if (widget.userType == '2') {
      return ProducerDashboard();
    } else if (widget.userType == '1') {
      return CertifierDashboard();
    } else if (widget.userType == '3') {
      return DistributerDashboard();
    }
    return Container();
  }
}
