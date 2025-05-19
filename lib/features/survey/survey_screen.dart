import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/features/survey/address_section.dart';
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
      body: ValueListenableBuilder<int>(
        valueListenable: surveyController.currentStep,
        builder: (context, value, _) {
          return Stepper(
            type: StepperType.horizontal,
            elevation: 0,
            currentStep: value,
            stepIconBuilder: _buildStepIcon,
            steps: _buildSteps(value),
            controlsBuilder: (context, details) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildStepButton(
                    context: context,
                    label: AppStrings.next,
                    onTap: details.onStepContinue,
                  ),
                  if (value > 0)
                    SizedBox(width: 4.w),
                  if (value > 0)
                    _buildStepButton(
                      context: context,
                      label: AppStrings.back,
                      onTap: details.onStepCancel,
                    ),
                ],
              );
            },
            onStepContinue: () {
              surveyController.onStepContinue(context: context);
            },
            onStepCancel: () {
              surveyController.currentStep.value -= 1;
            },
          );
        },
      ),
    );
  }

  /// Custom step icons
  Widget? _buildStepIcon(int stepIndex, StepState state) {
    final colorScheme = Theme.of(context).colorScheme;
    const iconSize = 14.0;

    switch (state) {
      case StepState.complete:
        return CircleAvatar(
          backgroundColor: colorScheme.primary,
          radius: 12,
          child: Icon(Icons.check, color: Colors.white, size: iconSize),
        );
      case StepState.editing:
        return CircleAvatar(
          backgroundColor: colorScheme.primary,
          radius: 12,
          child: Icon(Icons.edit, color: Colors.white, size: iconSize),
        );
      default:
        return CircleAvatar(
          backgroundColor: colorScheme.tertiary,
          radius: 12,
          child: Text(
            "${stepIndex + 1}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
    }
  }

  /// Survey steps list
  List<Step> _buildSteps(int currentStep) {
    return [
      Step(
        title:  Text(AppStrings.personal),
        content: PersonalDetailsSection(surveyController: surveyController),
        isActive: currentStep == 0,
        state: currentStep == 0 ? StepState.editing : StepState.complete,
      ),
      Step(
        title:  Text(AppStrings.address),
        content: AddressSection(surveyController: surveyController),
        isActive: currentStep == 1,
        state: currentStep == 1
            ? StepState.editing
            : currentStep > 1
            ? StepState.complete
            : StepState.disabled,
      ),
      Step(
        title:  Text(AppStrings.health),
        content: HealthSection(surveyController: surveyController),
        isActive: currentStep == 2,
        state: currentStep == 2 ? StepState.editing : StepState.disabled,
      ),
    ];
  }

  /// Custom button builder
  Widget _buildStepButton({
    required BuildContext context,
    required String label,
    required VoidCallback? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h,bottom: 4.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.sp),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
