import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reciper/bloc/theme/theme_cubit.dart';
import 'package:reciper/bloc/theme/theme_state.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/ui/widgets/sheet/select_theme_bottom_sheet.dart';

class AppearanceView extends StatelessWidget {
  const AppearanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.translate.appearance),
        ),
        body: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.color_lens),
                    title: Text(context.translate.theme),
                    trailing: CircleAvatar(
                      radius: 20,
                      backgroundColor: themeState.theme.lightTheme.primaryColor,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const SelectThemeBottomSheet();
                          });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListTile(
                      title: Text(themeState.themeMode == ThemeMode.light
                          ? context.translate.switch_to_dark_mode
                          : context.translate.switch_to_light_mode),
                      trailing: Switch(
                        value: themeState.themeMode == ThemeMode.dark,
                        thumbIcon: WidgetStateProperty.all(Icon(
                          themeState.themeMode == ThemeMode.dark
                              ? Icons.nightlight_round
                              : Icons.wb_sunny,
                          color: themeState.themeMode == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                        )),
                        onChanged: (value) {
                          BlocProvider.of<ThemeCubit>(context).toggleTheme();
                        },
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<ThemeCubit>(context).resetTheme();
                      },
                      child: Text(context.translate.reset_to_default_settings))
                ],
              ),
            );
          },
        ));
  }
}
