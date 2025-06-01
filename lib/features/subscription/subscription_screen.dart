import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/features/subscription/subscription_card.dart';
import 'package:starrbox/features/subscription/subscription_controller.dart';
import 'package:starrbox/features/subscription/subscription_plan.dart';

import '../../core/constants/strings.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late final SubscriptionController subscriptionController;

  @override
  void initState() {
    super.initState();
    subscriptionController =
        Provider.of<SubscriptionController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          AppStrings.chooseYours,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 2.h,),
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: 16.sp),
          //   child: Text(
          //     "Select the subscription that best fits your lifestyle and nutritional needs.",
          //     style: Theme.of(context).textTheme.bodyLarge,
          //   ),
          // ),
          // SizedBox(height: 2.h,),
          Expanded(
            child: ListView.separated(
           // shrinkWrap: true,
            padding: EdgeInsets.only(left: 16.sp,right: 16.sp,bottom: 4.h,top: 2.h),
                itemBuilder: (context, index) {
                  return SubscriptionCard(
                      plan: subscriptionController.plans[index]);
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 2.h,
                    ),
                itemCount: subscriptionController.plans.length),
          ),
        ],
      ),
    );
  }
}
