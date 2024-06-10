import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reciper/bloc/ai/ai_cubit.dart';
import 'package:reciper/bloc/language/language_cubit.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/model/ask_type.dart';
import 'package:reciper/routes/app_router.dart';

class SelectAskTypeSheet extends StatefulWidget {
  const SelectAskTypeSheet({super.key});

  @override
  State<SelectAskTypeSheet> createState() => _SelectAskTypeSheetState();
}

class _SelectAskTypeSheetState extends State<SelectAskTypeSheet> {
  bool showTextField = false;
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Widget buildAskTypeItem(AskType type) {
      return GestureDetector(
        onTap: () async {
          if (type == AskType.name) {
            setState(() {
              showTextField = true;
            });
          } else {
            BlocProvider.of<AiCubit>(context)
                .askToAi(
                    context.read<LanguageCubit>().state.locale.languageCode,
                    type,
                    null,
                    type == AskType.camera
                        ? ImageSource.camera
                        : ImageSource.gallery)
                .then((value) {
              context.push(AppRouter.aiResponseRoute);
            });
          }
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  type.icon,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              type.name.replaceFirst(type.name[0], type.name[0].toUpperCase()),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      );
    }

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
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                context.translate.ask_type,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 10),
            showTextField
                ? Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return context.translate.please_enter_food_name;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: context.translate.food_name,
                              hintText: "Ex. Tantuni",
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  BlocProvider.of<AiCubit>(context)
                                      .askToAi(
                                          context
                                              .read<LanguageCubit>()
                                              .state
                                              .locale
                                              .languageCode,
                                          AskType.name,
                                          nameController.text,
                                          null)
                                      .then((value) {
                                    context.push(AppRouter.aiResponseRoute);
                                  });
                                }
                              },
                              child:  Center(
                                child: Text(context.translate.get_recipe.toUpperCase()),
                              ))
                        ],
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...AskType.values.map((type) => buildAskTypeItem(type)),
                    ],
                  ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
