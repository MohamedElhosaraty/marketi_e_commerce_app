import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/core/helpers/extensions.dart';

import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/onboarding_list.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubit/onboarding_cubit.dart';

class OnboardingScreenBody extends StatelessWidget {
  const OnboardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        var cubit = OnboardingCubit.get(context);
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: cubit.pageController,
                  onPageChanged: (index) => cubit.changePage(index),
                  itemCount: onboardingList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        50.verticalSpace,
                        Image.asset(onboardingList[index].image),
                        20.verticalSpace,
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  onboardingList.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.only(right: 5),
                                    height:
                                        cubit.currentIndex == index ? 20 : 18,
                                    width:
                                        cubit.currentIndex == index ? 20 : 18,
                                    decoration: BoxDecoration(
                                      color:
                                          cubit.currentIndex == index
                                              ? AppColors.darkBlue
                                              : AppColors.lightBlue700,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        25.verticalSpace,
                        Text(
                          onboardingList[index].title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.poppins22SemiBold(
                            context,
                          ).copyWith(color: AppColors.darkBlue),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 35.0,
                            left: 15.0,
                            right: 15.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              onboardingList[index].description,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.poppins16Medium(
                                context,
                              ).copyWith(color: AppColors.darkBlue),
                            ),
                          ),
                        ),
                        16.verticalSpace,
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 40.0,
                            right: 16.0,
                            left: 16.0,
                          ),
                          child: CustomButton(
                            text:
                                cubit.currentIndex < onboardingList.length - 1
                                    ? 'Next'
                                    : 'Get Started',
                            onPressed: () {
                              if (cubit.currentIndex <
                                  onboardingList.length - 1) {
                                cubit.nextPage();
                              } else {
                                context.pushReplacementNamed(
                                  Routes.loginScreen,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
