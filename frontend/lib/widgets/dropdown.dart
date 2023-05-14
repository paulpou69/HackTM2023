import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/config/config.dart';

class CFDropDown extends StatefulWidget {
  final List<dynamic> items;
  final String? value;
  const CFDropDown({super.key, required this.items, this.value});

  @override
  State<CFDropDown> createState() => _CFDropDownState();
}

class _CFDropDownState extends State<CFDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      key: Key(widget.items.toString()),
      isExpanded: true,
      hint: Row(
        children: [
          Expanded(
            child: Text(
              'Select Material...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1,
                    color: Color(0xFFBDBDBD),
                    fontFamily: 'BasierCircle',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      buttonStyleData: ButtonStyleData(
        height: 51,
        width: 275,
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: primary,
            width: 1.5,
          ),
          color: Color(0xFF000303),
        ),
      ),
      value: widget.value,
      onChanged: (value) {
        setState(() {
          print(value as String);
        });
      },
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        padding: null,
        decoration: BoxDecoration(
          color: Color(0xFF000303),
          border: Border.all(
            color: primary,
            width: 1.5,
          ),
        ),
        elevation: 8,
        scrollbarTheme: ScrollbarThemeData(
          thickness: MaterialStateProperty.all(2),
          thumbVisibility: MaterialStateProperty.all(true),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        overlayColor: MaterialStateProperty.all(
          Color(0x2900D8D6),
        ),
      ),
      iconStyleData: const IconStyleData(),
      items: widget.items
          .map((item) => DropdownMenuItem<String>(
                value: item.toString(),
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Color(0xFFF3FFFF),
                        fontFamily: 'BasierCircle',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
    ));
  }
}
