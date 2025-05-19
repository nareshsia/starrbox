import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/core/validation/validation.dart';
import 'package:starrbox/features/components/custom_dropdown_textfield.dart';
import 'package:starrbox/features/components/custom_textformfield.dart';
import 'package:starrbox/features/survey/survey_controller.dart';

class AddressSection extends StatelessWidget {
  final SurveyController surveyController;

  const AddressSection({super.key, required this.surveyController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: surveyController.formKeyAddress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFieldWidget(
              controller: surveyController.addressLine1Controller,
              hintText: "Flat, House no., Building, Company, Apartment",
              labelTwo: "Address Line 1",
              readOnly: false,
          onValidate: Validation.addressLine1,),
          SizedBox(
            height: 2.h,
          ),
          CustomTextFieldWidget(
              controller: surveyController.addressLine1Controller,
              hintText: "Area, Street, Sector, Village",
              labelTwo: "Address Line 2",
              readOnly: false, onValidate: Validation.addressLine2),
          SizedBox(
            height: 2.h,
          ),
          ValueListenableBuilder<String?>(
            valueListenable: surveyController.selectedState,
            builder: (context, selectedState, _) {
              return CustomDropdownWidget<String>(
                label: "State",
                hintText: "Select your state",
                value: selectedState,
                items: surveyController.stateList.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e, style: Theme.of(context).textTheme.bodyMedium),
                  );
                }).toList(),
                onChanged: (value) {
                  surveyController.selectedState.value = value;
                  surveyController.selectedDistrict.value =
                      null; // clear previous district
                },
                validator:Validation.state,
              );
            },
          ),
          SizedBox(height: 2.h),
          ValueListenableBuilder<String?>(
            valueListenable: surveyController.selectedState,
            builder: (context, selectedState, _) {
              final districtList = surveyController.currentDistrictList;
              final isEnabled = selectedState != null;

              return ValueListenableBuilder<String?>(
                valueListenable: surveyController.selectedDistrict,
                builder: (context, selectedDistrict, _) {
                  return IgnorePointer(
                    ignoring: !isEnabled,
                    child: Opacity(
                      opacity: isEnabled ? 1 : 0.5,
                      child: CustomDropdownWidget<String>(
                        label: "District",
                        hintText: "Select your district",
                        value: selectedDistrict,
                        items: districtList.map((e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(e,
                                style: Theme.of(context).textTheme.bodyMedium),
                          );
                        }).toList(),
                        onChanged: (value) {
                          surveyController.selectedDistrict.value = value;
                        },
                        validator:Validation.district,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextFieldWidget(
              controller: surveyController.pinCodeController,
              hintText: "Enter your pinCode",
              labelTwo: "PinCode",
              readOnly: false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ],
            onValidate:Validation.pinCode,
          ),
          SizedBox(
            height: 2.h,
          ),
          /// delivery timings
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery Timing",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              ValueListenableBuilder(
                valueListenable: surveyController.selectedDeliveryTimingIndex,
                builder: (context, selectedIndex, child) {
                  return Row(
                    children: surveyController.deliveryTimings.asMap().entries.map(
                          (entry) {
                        final index = entry.key;
                        final timing = entry.value;
                        return Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.sp),
                            onTap: () {
                              surveyController.selectedDeliveryTimingIndex.value =
                                  index;
                            },
                            child: Container(
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
                              child: Center(child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12.sp),
                                child: Text(timing),
                              )),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: surveyController.deliveryTimingError,
                builder: (context, show, child) {
                  if (show) {
                    return Padding(
                      padding: EdgeInsets.only(left: 14, top: 6),
                      child: Text(
                        "Please select delivery time",
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
          /// address type
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address Type",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              ValueListenableBuilder(
                valueListenable: surveyController.selectedAddressTypeIndex,
                builder: (context, selectedIndex, child) {
                  return Row(
                    children: surveyController.addressTypes.asMap().entries.map(
                          (entry) {
                        final index = entry.key;
                        final type = entry.value;
                        return Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.sp),
                            onTap: () {
                              surveyController.selectedAddressTypeIndex.value =
                                  index;
                            },
                            child: Container(
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
                              child: Center(child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12.sp),
                                child: Text(type),
                              )),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: surveyController.deliveryTimingError,
                builder: (context, show, child) {
                  if (show) {
                    return Padding(
                      padding: EdgeInsets.only(left: 14, top: 6),
                      child: Text(
                        "Please select delivery time",
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
        ],
      ),
    );
  }
}
