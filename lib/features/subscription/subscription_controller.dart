import 'package:flutter/cupertino.dart';
import 'package:starrbox/features/subscription/subscription_plan.dart';

class SubscriptionController extends ChangeNotifier {
  final List<SubscriptionPlan> plans = [
    SubscriptionPlan(
      name: 'Premium Box',
      price: '₹3299',
      features: [
        '4 Fruits',
        'Dry Fruit',
        'Egg',
        'Veg',
        'Legume',
        'Seed',
        'Nuts'
      ],
      isPopular: true
    ),
    SubscriptionPlan(
      name: 'Standard Box',
      price: '₹2680',
      features: ['3 Fruits', 'Egg', 'Veg', 'Legume', 'Seed', 'Nuts'],
    ),
    SubscriptionPlan(
      name: 'Kids Box',
      price: '₹2160',
      features: ['3 Fruits', 'Dry Fruits', 'Egg', 'Nuts', 'Legume'],
    ),
  ];
}
