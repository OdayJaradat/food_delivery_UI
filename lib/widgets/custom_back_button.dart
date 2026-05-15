import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_secondary_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key, required this.height, required this.width, required this.onTap});

  final double height;
  final double width;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CustomSecondaryButton(
        width: width,
        height: height,
        onTap: onTap,
        iconData: Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back);
  }
}
