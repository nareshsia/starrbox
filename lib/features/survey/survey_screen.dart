import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/features/components/custom_textformfield.dart';
import 'package:starrbox/features/survey/health_section.dart';
import 'package:starrbox/features/survey/personal_details_section.dart';
import 'package:starrbox/features/survey/survey_controller.dart';

import '../../core/constants/strings.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  late final SurveyController surveyController;

  @override
  void initState() {
    super.initState();
    surveyController = Provider.of<SurveyController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          AppStrings.personalInfo,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: surveyController.currentStep,
        builder: (context, value, child) {
          return Stepper(
            type: StepperType.horizontal,
            elevation: 0,
            currentStep: value,
            stepIconBuilder: (stepIndex, stepState) {
              if (stepState == StepState.complete) {
                return Icon(Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary);
              } else if (stepState == StepState.editing) {
                return Icon(Icons.edit,
                    color: Theme.of(context).colorScheme.secondary);
              } else {
                return CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  radius: 12,
                  child: Text(
                    "${stepIndex + 1}",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                );
              }
            },
            steps: [
              Step(
                  title: Text("Personal"),
                  content: PersonalDetailsSection(
                    surveyController: surveyController,
                  ),
                  isActive: value == 0,
                  state: value == 0 ? StepState.editing : StepState.complete),
              Step(
                  title: Text("Address"),
                  content: Container(),
                  isActive: value == 1,
                  state: value == 1
                      ? StepState.editing
                      : value == 2
                          ? StepState.complete
                          : StepState.disabled),
              Step(
                  title: Text("Health"),
                  content: HealthSection(
                    surveyController: surveyController,
                  ),
                  isActive: value == 2,
                  state: value == 2 ? StepState.editing : StepState.disabled),
            ],
            controlsBuilder: (context, details) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.sp),
                      onTap: details.onStepContinue,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.sp, vertical: 1.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: Theme.of(context).colorScheme.primary),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (surveyController.currentStep.value > 0)
                    Padding(
                      padding: EdgeInsets.only(top: 4.h, left: 5.w),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.sp),
                        onTap: details.onStepCancel,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.sp, vertical: 1.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              color: Theme.of(context).colorScheme.primary),
                          child: Center(
                            child: Text(
                              "Back",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
            onStepContinue: surveyController.onStepContinue,
            onStepCancel: () {
              surveyController.currentStep.value -= 1;
            },
          );
        },
      ),
    );
  }
}
