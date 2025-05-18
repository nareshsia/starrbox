import 'package:flutter/material.dart';

class SurveyController extends ChangeNotifier {
  ValueNotifier<int> currentStep = ValueNotifier(0);

  /// stepper
  onStepContinue() {
    if(currentStep.value < 2){
      currentStep.value += 1;
      // if (currentStep.value == 0) {
      //   if (!formKey.currentState!.validate() ||
      //       selectedGenderIndex.value == -1) {
      //     if (selectedGenderIndex.value == -1) {
      //       genderError.value = true;
      //     } else {
      //       genderError.value = false;
      //     }
      //
      //   }else{
      //     currentStep.value += 1;
      //   }
      // }else{
      //   currentStep.value += 1;
      // }
    }

  }

  /// personal
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController fruitController = TextEditingController();
  List<String> genderList = ["Male", "Female", "Others"];
  ValueNotifier<int> selectedGenderIndex = ValueNotifier(-1);
  ValueNotifier<bool> genderError = ValueNotifier(false);

  /// Health
  ValueNotifier<bool?> isPregnant = ValueNotifier(null);
  ValueNotifier<bool?> isAllergies = ValueNotifier(null);
}
