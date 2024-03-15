import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukandoit/theme/theme.controller.dart';

enum UkanButtonSize { small, medium, large }

class UkanFloatingButton extends StatelessWidget {
  final UkanButtonSize size;
  final Color? color;
  final IconData icon;
  final Function() onTap;

  const UkanFloatingButton({
    super.key,
    this.color,
    required this.icon,
    required this.onTap,
  }) : size = UkanButtonSize.medium;

  const UkanFloatingButton.small({
    super.key,
    this.color,
    required this.icon,
    required this.onTap,
  }) : size = UkanButtonSize.small;

  const UkanFloatingButton.large({
    super.key,
    this.color,
    required this.icon,
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
      width: _size,
      height: _size,
      child: Card(
        elevation: 0,
        color: substitueColor.withOpacity(0.10),
        child: InkWell(
          onTap: onTap,
          splashColor: substitueColor.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10),
          child: Icon(
            icon,
            color: substitueColor,
            size: _size / 2,
          ),
        ),
      ),
    );
  }
}
