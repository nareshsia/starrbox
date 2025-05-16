import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/features/components/custom_textformfield.dart';

import '../../core/constants/strings.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  List<String> genderList = ["Male", "Female", "Others"];
  ValueNotifier<int> selectedGenderIndex = ValueNotifier(-1);

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            CustomTextFieldWidget(
                controller: TextEditingController(),
                labelTwo: AppStrings.name,
                hintText: AppStrings.nameHint,
                readOnly: false),
            SizedBox(
              height: 2.h,
            ),
            CustomTextFieldWidget(
                controller: TextEditingController(),
                labelTwo: AppStrings.email,
                hintText: AppStrings.emailHint,
                readOnly: false),
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
                  valueListenable: selectedGenderIndex,
                  builder: (context, selectedIndex, child) {
                    return Row(
                      children: genderList.asMap().entries.map(
                            (entry) {
                          final index = entry.key;
                          final gender = entry.value;
                          return Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12.sp),
                              onTap: () {
                                selectedGenderIndex.value = index;
                              },
                              child: Container(
                                width: 20.w,
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    border: Border.all(
                                        color:
                                        selectedIndex == index ? Theme.of(context).colorScheme.primary:   Theme.of(context).colorScheme.onSurface,width: selectedIndex == index ?0.5.w:0.2.w)),
                                child: Center(child: Text(gender)),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),

          ],
        ),
      ),
    );
  }
}
