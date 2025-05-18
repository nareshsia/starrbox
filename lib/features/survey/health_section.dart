import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/features/components/custom_textformfield.dart';
import 'package:starrbox/features/survey/survey_controller.dart';

class HealthSection extends StatelessWidget {
  final SurveyController surveyController;

  const HealthSection({super.key, required this.surveyController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// pregnant
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Are you Pregnant?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ValueListenableBuilder(
              valueListenable: surveyController.isPregnant,
              builder: (context, value, child) {
                return Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: value,
                      onChanged: (value) {
                        if (value != null) {
                          surveyController.isPregnant.value = value;
                        }
                      },
                    ),
                    Text("Yes"),
                    Radio<bool>(
                      value: false,
                      groupValue: value,
                      onChanged: (value) {
                        if (value != null) {
                          surveyController.isPregnant.value = value;
                        }
                      },
                    ),
                    Text("No"),
                  ],
                );
              },
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),

        /// Allergies
        ValueListenableBuilder(
          valueListenable: surveyController.isAllergies,
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you have Fruit Allergies?",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: value,
                      onChanged: (value) {
                        if (value != null) {
                          surveyController.isAllergies.value = value;
                        }
                      },
                    ),
                    Text(
                      "Yes",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Radio<bool>(
                      value: false,
                      groupValue: value,
                      onChanged: (value) {
                        if (value != null) {
                          surveyController.isAllergies.value = value;
                        }
                      },
                    ),
                    Text(
                      "No",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                value != null && value
                    ? Padding(
                      padding:  EdgeInsets.only(top: 2.h),
                      child: CustomTextFieldWidget(
                          controller: surveyController.fruitController,
                          hintText: 'Enter allergies fruit',
                          readOnly: false,
                        ),
                    )
                    : SizedBox.shrink()
              ],
            );
          },
        ),
      ],
    );
  }
}
