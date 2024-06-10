import 'package:flutter/material.dart';
import 'package:reciper/core/extensions/context_extension.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${context.translate.loading}...",
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
