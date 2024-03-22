import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/theme/theme.controller.dart';

enum UkanButtonSize { small, medium, large }

class UkanTextButton extends StatelessWidget {
  final UkanButtonSize size;
  final Color? color;
  final IconData? icon;
  final String text;
  final Function() onTap;

  const UkanTextButton({
    super.key,
    this.color,
    required this.text,
    this.icon,
    required this.onTap,
  }) : size = UkanButtonSize.medium;

  const UkanTextButton.small({
    super.key,
    this.color,
    required this.text,
    this.icon,
    required this.onTap,
  }) : size = UkanButtonSize.small;

  const UkanTextButton.large({
    super.key,
    this.color,
    required this.text,
    this.icon,
    required this.onTap,
  }) : size = UkanButtonSize.large;

  double get _size {
    switch (size) {
      case UkanButtonSize.small:
        return 48.0;
      case UkanButtonSize.medium:
        return 64.0;
      case UkanButtonSize.large:
        return 80.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    late Color substitueColor;
    if (color == null) {
      substitueColor = Get.find<ThemeController>().primaryColor.value;
    } else {
      substitueColor = color!;
    }

    return SizedBox(
      height: _size,
      child: MaterialButton(
        color: substitueColor.withOpacity(0.20),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        splashColor: substitueColor.withOpacity(0.25),
        hoverColor: substitueColor.withOpacity(0.05),
        focusColor: substitueColor.withOpacity(0.05),
        highlightColor: substitueColor.withOpacity(0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null)
              Icon(
                icon,
                color: substitueColor,
                size: _size / 2,
              ),
            SizedBox(width: icon == null ? 0 : 8.0),
            Text(
              text,
              style: TextStyle(
                color: substitueColor,
                fontSize: _size / 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
