import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/core/constants/strings.dart';
import 'package:starrbox/routes/route_names.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          AppStrings.otpVerification,
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
            Text(
              AppStrings.verificationCodeDes,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "+918248159579",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Pinput(
                    length: 4,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    defaultPinTheme: PinTheme(
                      width: 15.w, // approx. 60 logical pixels on most screens
                      height: 7.h, // tweak as needed to match 60 px visually
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(12.sp),
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 15.w, // approx. 60 logical pixels on most screens
                      height: 7.h, // tweak as needed to match 60 px visually
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(12.sp),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    onCompleted: (value) {
                     Navigator.pushNamed(context, RouteNames.survey);
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  AppStrings.didNotOTP,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  AppStrings.reSend,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      decorationColor: Theme.of(context).colorScheme.primary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
