import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/popups/add_stock.dart';
import 'package:frontend/widgets/buttons.dart';

class DistributerTag extends StatefulWidget {
  final String name;
  final String stockQuantity;
  final dynamic materials;
  const DistributerTag({
    super.key,
    required this.name,
    required this.stockQuantity,
    required this.materials,
  });

  @override
  State<DistributerTag> createState() => _DistributerTagState();
}

class _DistributerTagState extends State<DistributerTag> {
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
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Row(
                children: [
                  Text(
                    'Stock Quantity',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1,
                          color: Color(0xFFF3FFFF),
                          fontFamily: 'BasierCircle',
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    widget.stockQuantity,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1,
                          color: Color(0xFFF3FFFF),
                          fontFamily: 'BasierCircle',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                'Materials:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1,
                      color: Color(0xFFF3FFFF),
                      fontFamily: 'BasierCircle',
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        widget.materials[index]['name'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1,
                              color: Color(0xFFF3FFFF),
                              fontFamily: 'BasierCircle',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        'from ${widget.materials[index]['producer']}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1,
                              color: Color(0xFFBDBDBD),
                              fontFamily: 'BasierCircle',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      widget.materials[index]['quantity'],
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1,
                            color: Color(0xFFF3FFFF),
                            fontFamily: 'BasierCircle',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                    ),
                  ],
                );
              },
              itemCount: widget.materials.length,
            ),

            // Text(
            //   widget.address,
            //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            //         height: 1,
            //         color: Color(0xFFF3FFFF),
            //         fontFamily: 'BasierCircle',
            //         fontWeight: FontWeight.w400,
            //         fontSize: 16,
            //       ),
            // ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CFButton(
                  icon: 'next.svg',
                  label: 'Download QR',
                  onTap: () {},
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AddStockPopup(
                              contractAddress: '', name: widget.name);
                        });
                  },
                  child: Text(
                    'Add Stock',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1,
                          color: primary,
                          fontFamily: 'BasierCircle',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
