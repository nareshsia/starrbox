import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/core/validation/validation.dart';
import 'package:starrbox/features/survey/survey_controller.dart';

import '../../core/constants/strings.dart';
import '../components/custom_textformfield.dart';

class PersonalDetailsSection extends StatefulWidget {
  final SurveyController surveyController;

  const PersonalDetailsSection({super.key, required this.surveyController});

  @override
  State<PersonalDetailsSection> createState() => _PersonalDetailsSectionState();
}

class _PersonalDetailsSectionState extends State<PersonalDetailsSection> {
  @override
  Widget build(BuildContext context) {
    final surveyController = widget.surveyController;
    return Form(
      key: surveyController.formKey,
      child: Column(
        children: [
          CustomTextFieldWidget(
            controller: surveyController.nameController,
            labelTwo: AppStrings.name,
            hintText: AppStrings.nameHint,
            readOnly: false,
            onValidate: Validation.name,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextFieldWidget(
            controller: surveyController.emailController,
            labelTwo: AppStrings.email,
            hintText: AppStrings.emailHint,
            readOnly: false,
            onValidate: Validation.email,
          ),
          SizedBox(
            height: 2.h,
          ),

          /// Gender
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gender",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              ValueListenableBuilder(
                valueListenable: surveyController.selectedGenderIndex,
                builder: (context, selectedIndex, child) {
                  return Row(
                    children: surveyController.genderList.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final gender = entry.value;
                        return Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.sp),
                            onTap: () {
                              surveyController.selectedGenderIndex.value =
                                  index;
                            },
                            child: Container(
                              width: 20.w,
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.sp),
                                  border: Border.all(
                                      color: selectedIndex == index
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                      width: selectedIndex == index
                                          ? 0.5.w
                                          : 0.2.w)),
                              child: Center(child: Text(gender)),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: surveyController.genderError,
                builder: (context, show, child) {
                  if (show) {
                    return Padding(
                      padding: EdgeInsets.only(left: 14, top: 6),
                      child: Text(
                        "Please select gender",
                        style: TextStyle(
                            fontSize: 15.5.sp,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.normal),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextFieldWidget(
            controller: surveyController.dobController,
            labelTwo: AppStrings.dob,
            hintText: AppStrings.dobHint,
            onValidate: Validation.dob,
            readOnly: true,
            //enable: false,
            suffixIcon: IconButton(
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1960),
                      lastDate: DateTime.now());
                  if(pickedDate != null){
                    final formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                    surveyController.dobController.text = formattedDate;
                  }
                },
                icon: Icon(Icons.date_range_outlined)),
          ),
        ],
      ),
    );
  }
}
