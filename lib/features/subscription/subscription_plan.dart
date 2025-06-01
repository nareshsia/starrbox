class SubscriptionPlan {
  final String name;
  final String price;
  final List<String> features;
  final bool isPopular;

  SubscriptionPlan(
      {required this.name,
      required this.price,
      required this.features,
      this.isPopular = false});
}
