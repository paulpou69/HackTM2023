import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/config/config.dart';

class Header extends StatefulWidget {
  final String address;
  final String name;
  const Header({super.key, required this.address, required this.name});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/logo_bw.svg'),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SvgPicture.asset('assets/logo_clr.svg'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: primary,
                          fontFamily: 'BasierCircle',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    '${widget.address.substring(0, 4)}...${widget.address.substring(widget.address.length - 4)}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
