import 'package:flutter/material.dart';
import 'package:reciper/ui/widgets/other/safe_on_tap.dart';

class CircularIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  const CircularIconButton(
      {super.key, required this.onTap, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return SafeOnTap(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary),
        child: Center(
          child: Icon(
            iconData,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
