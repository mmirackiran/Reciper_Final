import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class Space extends StatelessWidget {
  final double? widthRate;
  final double? heightRate;
  const Space({super.key,  this.widthRate,  this.heightRate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthRate == null ? 0 : context.sized.dynamicWidth(widthRate!),
      height: heightRate == null ? 0 : context.sized.dynamicHeight(heightRate!),

    );
  }
}