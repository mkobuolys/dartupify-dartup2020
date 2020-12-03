import 'package:flutter/cupertino.dart';

class CupertinoSwitcher extends StatelessWidget {
  final bool isActive;
  final ValueSetter<bool> onChanged;

  const CupertinoSwitcher({
    @required this.isActive,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: isActive,
      onChanged: onChanged,
    );
  }
}
