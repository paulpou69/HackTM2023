import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';

class CertifierTag extends StatefulWidget {
  final String name;
  final String address;
  const CertifierTag({
    super.key,
    required this.name,
    required this.address,
  });

  @override
  State<CertifierTag> createState() => _CertifierTagState();
}

class _CertifierTagState extends State<CertifierTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF000303),
        border: Border.all(
          color: Color(0xFFF3FFFF),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
          left: 26.0,
          bottom: 24.0,
          right: 26.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                widget.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1,
                      color: primary,
                      fontFamily: 'ClashDisplay',
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Contract Address',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1,
                      color: Color(0xFFF3FFFF),
                      fontFamily: 'BasierCircle',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
              ),
            ),
            Text(
              widget.address,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1,
                    color: Color(0xFFF3FFFF),
                    fontFamily: 'BasierCircle',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
