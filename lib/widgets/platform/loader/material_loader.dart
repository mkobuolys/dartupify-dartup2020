import 'package:flutter/material.dart';

import 'package:dartupify/constants.dart';

class MaterialLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(kBlackColor),
      ),
    );
  }
}
