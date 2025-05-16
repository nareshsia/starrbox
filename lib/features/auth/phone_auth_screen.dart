import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/core/constants/assets.dart';
import 'package:starrbox/core/constants/strings.dart';

import '../components/custom_textformfield.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  ValueNotifier<bool> isValid = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.appName,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                AppStrings.welcomeDescription,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Image.asset(
                AppAssets.auth,
                width: 75.w,
                height: 30.h,
                fit: BoxFit.contain,
              ),
              CustomTextFieldWidget(
                controller: phoneNumberController,
                hintText: '10 - digit mobile number',
                readOnly: false,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Only allow numbers
                  LengthLimitingTextInputFormatter(10),
                ],
                onChanged: (number) {
                  isValid.value = number.trim().length == 10;
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              ValueListenableBuilder(
                valueListenable: isValid,
                builder: (context, value, child) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(10.sp),
                    onTap: value ? () {

                    } : null,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: value
                              ? Theme.of(context).colorScheme.onSurface
                              : Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.2)),
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(color: value
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.5)),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
