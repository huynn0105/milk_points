import 'package:flutter/material.dart';

class NoPaddingCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool newValue) onChanged;
  final double size;
  final Color? activeColor;

  const NoPaddingCheckbox({super.key, 
    required this.value,
    required this.onChanged,
    this.size = 24,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size, maxWidth: size),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Icon(_getIconData(), size: size,color: activeColor,),
        onPressed: () => onChanged(!value),
      ),
    );
  }

  IconData _getIconData() {
    if (value) {
      return Icons.check_box;
    }

    return Icons.check_box_outline_blank;
  }
}