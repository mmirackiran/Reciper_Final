import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reciper/bloc/theme/theme_cubit.dart';
import 'package:reciper/bloc/theme/theme_state.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/model/theme_model.dart';

class SelectThemeBottomSheet extends StatelessWidget {
  const SelectThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildThemeWidget(
        {required ThemeModel theme,
        required bool isSelected,
        required Function() onSelect}) {
      return ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: theme.lightTheme.primaryColor,
        ),
        title: Text(theme.name),
        trailing: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
        onTap: onSelect,
      );
    }

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    context.translate.theme,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 10),
                ...ThemeModel.themes.map((theme) => buildThemeWidget(
                      theme: theme,
                      isSelected: state.theme == theme,
                      onSelect: () {
                        BlocProvider.of<ThemeCubit>(context).changeTheme(theme);
                        Navigator.pop(context);
                      },
                    )),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
