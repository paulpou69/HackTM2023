import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/config/config.dart';

class CFButton extends StatefulWidget {
  final String icon;
  final String label;
  final void Function() onTap;
  final bool filled;
  final Color? fillColor;

  const CFButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.filled = true,
    this.fillColor,
  });

  @override
  State<CFButton> createState() => _CFButtonState();
}

class _CFButtonState extends State<CFButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: primary, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  height: 48,
                  width: 48,
                  color: primary,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      widget.icon,
                      color: widget.filled ? background2 : null,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: primary,
                        fontFamily: 'BasierCircle',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
