import 'package:flutter/material.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/ui/widgets/sheet/select_ask_type_sheet.dart';

class AskToAiButton extends StatelessWidget {
  const AskToAiButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        icon: const Icon(Icons.room_service),
        label: Text(context.translate.ask_for_recipe),
        onPressed: () async {
          showBottomSheet(
            context: context,
            builder: (context) {
              return const SelectAskTypeSheet();
            },
          );
        });
  }
}
