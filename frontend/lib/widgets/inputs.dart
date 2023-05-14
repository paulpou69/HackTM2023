import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';

class CFTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const CFTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<CFTextField> createState() => _CFTextFieldState();
}

class _CFTextFieldState extends State<CFTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: widget.controller,
        style: TextStyle(
          color: text,
        ),
        cursorColor: primary,
        decoration: InputDecoration(
          hintText: widget.label,
          contentPadding: const EdgeInsets.all(16),
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: grey2,
                fontFamily: 'BasierCircle',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
          alignLabelWithHint: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: primary,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: primary,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}
