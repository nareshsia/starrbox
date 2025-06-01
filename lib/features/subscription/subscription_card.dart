import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starrbox/features/subscription/subscription_plan.dart';

class SubscriptionCard extends StatelessWidget {
  final SubscriptionPlan plan;

  const SubscriptionCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
      color: Theme.of(context).colorScheme.tertiary,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding:  EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // ✅ Avoids layout overflow in scroll
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Plan Title & Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      plan.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          plan.price,
                          style:Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "per month",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 1.h),
                Divider(thickness: 0.4),

                /// Features List
                ...plan.features.map((f) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                              size: 20),
                          SizedBox(width: 8),
                          Expanded(
                              child: Text(
                            f,
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                        ],
                      ),
                    )),

                SizedBox(height: 1.5.h),

                /// No Tax Label
                Text(
                  "No tax included",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),

                SizedBox(height: 16),

                /// Subscribe Button

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp), // Add margin
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Subscribe Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        foregroundColor: Colors.white,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 16), // taller button
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )


              ],
            ),
          ),
        ),

        /// Most Popular Badge
        // if (plan.isPopular)
        //   Positioned(
        //     top: 2,
        //     left: 10,
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        //       decoration: BoxDecoration(
        //         color: Colors.orange.shade700,
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //       child: Text(
        //         "Most Popular",
        //         style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
