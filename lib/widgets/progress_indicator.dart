import 'package:flutter/material.dart';
import '../theme.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const CustomProgressIndicator({super.key, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Theme.of(context).primary60,
        ),
      ),
    );
  }
}
