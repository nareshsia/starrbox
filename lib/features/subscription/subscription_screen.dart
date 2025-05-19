import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
      title: Text(
      AppStrings.chooseYours,
      style: Theme.of(context).textTheme.titleLarge,
    ),
    ),
      body: Column(
        children: [
          Text("")
        ],
      ),
    );
  }
}
