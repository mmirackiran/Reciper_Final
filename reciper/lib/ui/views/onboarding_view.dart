import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:reciper/bloc/onboarding/onboarding_cubit.dart';
import 'package:reciper/constants/app_constants.dart';
import 'package:reciper/gen/assets.gen.dart';
import 'package:reciper/model/onboarding_model.dart';
import 'package:reciper/routes/app_router.dart';
import 'package:reciper/ui/widgets/button/circular_icon_button.dart';
import 'package:reciper/ui/widgets/other/space.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController onboardingController = PageController();
  List<OnboardingModel> models = [
    OnboardingModel(
        image: Assets.images.logo512x512,
        titleSpan: [
          const TextSpan(
              text: "Welcome ",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.mainColor)),
          const TextSpan(
              text: "to Reciper App",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: AppConstants.mainColor))
        ],
        description: "Everything about foods."),
    OnboardingModel(
        image: Assets.images.logo512x512,
        titleSpan: [
          const TextSpan(
              text: "Learn",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.mainColor)),
          const TextSpan(
              text: ", Grow, Cook",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: AppConstants.mainColor))
        ],
        description: "For food and culture lovers."),
  ];

  late int index;
  bool get isLastPage => index == (models.length - 1);

  @override
  void initState() {
    setState(() {
      index = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<OnboardingCubit>(context).state.isCompleted) {
      context.pushReplacement(AppRouter.homeRoute);
    }

    Widget buildIndicator(int count) {
      // Banner indicator
      return Container(
        alignment: Alignment.center,
        child: SmoothPageIndicator(
          controller: onboardingController,
          count: count,
          effect: WormEffect(
            dotHeight: 5,
            dotWidth: context.sized.dynamicWidth(0.1),
            dotColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            activeDotColor: Theme.of(context).colorScheme.primary,
            type: WormType.thin,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Space(
                heightRate: 0.05,
              ),
              // Image widget
              Expanded(
                child: PageView.builder(
                    onPageChanged: (value) => setState(() => index = value),
                    itemCount: models.length,
                    controller: onboardingController,
                    itemBuilder: (context, index) {
                      var onboarding = models[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                              child: onboarding.image.image(
                                  height: context.sized.dynamicHeight(0.5))),
                          Column(
                            children: [
                              RichText(
                                  text:
                                      TextSpan(children: onboarding.titleSpan)),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                onboarding.description,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildIndicator(models.length),
                  CircularIconButton(
                      iconData: index == (models.length - 1)
                          ? Icons.check
                          : Icons.arrow_forward,
                      onTap: () async {
                        if (isLastPage) {
                          await context
                              .read<OnboardingCubit>()
                              .completeOnboarding();
                          context.pushReplacement(AppRouter.homeRoute);
                          await context
                              .read<OnboardingCubit>()
                              .initOnboarding();
                        } else {
                          onboardingController.animateToPage(index + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      }),
                ],
              ),
              const Space(
                heightRate: 0.03,
              )
            ],
          ),
        ),
      ),
    );
  }
}
