import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/routes/app_router.dart';
import 'package:reciper/ui/widgets/other/safe_on_tap.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeOnTap(
      onTap: () {
        context.push(AppRouter.settingsRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          Icons.settings_outlined,
          color: context.textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}
