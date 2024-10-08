import 'package:flutter/material.dart';

class ToggleIcon extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final IconData? iconSelected;
  final Color? color;
  final Color? colorSelected;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  const ToggleIcon({
    super.key,
    required this.selected,
    required this.icon,
    this.iconSelected,
    this.color,
    this.colorSelected,
    required this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: selected
            ? Icon(icon, color: color)
            : Icon(iconSelected ?? icon, color: colorSelected ?? color),
      ),
    );
  }
}
