import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewProduct extends StatelessWidget {
  final String productId;
  const ViewProduct({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6E8685),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/Subtract.svg',
              width: 150,
              height: 300,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              'assets/Subtract2.svg',
              width: 150,
              height: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 48.0),
                  child: SvgPicture.asset(
                    'assets/logo_bw.svg',
                    height: 24,
                  ),
                ),
                Text(
                  'Product',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1,
                        color: Color(0xFF000303),
                        fontFamily: 'BasierCircle',
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    'History',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1,
                          color: Color(0xFF000303),
                          fontFamily: 'ClashDisplay',
                          fontWeight: FontWeight.w600,
                          fontSize: 56,
                        ),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color(0xFF000303),
                          border: Border.all(
                            color: Color(0xFFF3FFFF),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color(0xFF000303),
                          border: Border.all(
                            color: Color(0xFFF3FFFF),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        height: 128,
                        decoration: BoxDecoration(
                          color: Color(0xFF000303),
                          border: Border.all(
                            color: Color(0xFFF3FFFF),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        height: 128,
                        decoration: BoxDecoration(
                          color: Color(0xFF000303),
                          border: Border.all(
                            color: Color(0xFFF3FFFF),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
