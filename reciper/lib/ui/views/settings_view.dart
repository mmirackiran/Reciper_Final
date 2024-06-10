import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:reciper/bloc/theme/theme_cubit.dart';
import 'package:reciper/bloc/theme/theme_state.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/ui/views/appearance_view.dart';
import 'package:reciper/ui/widgets/sheet/language_select_bottom_sheet.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(context.translate.settings),
        ),
        body: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.color_lens),
                    title: Text(context.translate.appearance),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppearanceView()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(context.translate.language_selection),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const LanguageSelectBottomSheet();
                          });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: Text(context.translate.rate_us),
                    onTap: () async {
                      final InAppReview inAppReview = InAppReview.instance;

                      if (await inAppReview.isAvailable()) {
                        inAppReview.requestReview();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                            child: Text(
                                "${context.translate.version}: ${snapshot.data!.version}"),
                          );
                        } else {
                          return Container();
                        }
                      })
                ],
              ),
            );
          },
        ));
  }
}
