import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:reciper/bloc/ai/ai_cubit.dart';
import 'package:reciper/bloc/ai/ai_state.dart';
import 'package:reciper/core/extensions/context_extension.dart';
import 'package:reciper/core/utilities/bold_parser.dart';
import 'package:reciper/gen/assets.gen.dart';

class GptResponseView extends StatelessWidget {
  const GptResponseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(context.translate.ai_food_recipe),
      ),
      body: BlocBuilder<AiCubit, AiState>(builder: (context, state) {
        return state.response?.content == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(Assets.lottie.aiGenerating),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(context.translate.recipe_generating,
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500))
                  ],
                ),
              )
            : Container(
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: BoldParser.richText(state.response?.content ??
                            context.translate.ai_thinking),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 15),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
