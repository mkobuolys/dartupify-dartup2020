import 'package:flutter/material.dart';

class MaterialSwitcher extends StatelessWidget {
  final bool isActive;
  final ValueSetter<bool> onChanged;

  const MaterialSwitcher({
    @required this.isActive,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isActive,
      onChanged: onChanged,
    );
  }
}
