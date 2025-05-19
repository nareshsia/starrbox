import 'package:flutter/material.dart';
import 'package:starrbox/routes/route_names.dart';

class SurveyController extends ChangeNotifier {
  ValueNotifier<int> currentStep = ValueNotifier(0);

  /// stepper
  onStepContinue({required BuildContext context}) {
    if (currentStep.value < 2) {
      currentStep.value += 1;
      // if(currentStep.value == 1){
      //   if(formKeyAddress.currentState!.validate()){
      //
      //   }
      // }else{
      //   currentStep.value += 1;
      // }

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
    }else{
      Navigator.pushNamed(context, RouteNames.subscription);
    }
  }

  /// personal
  GlobalKey<FormState> formKeyPersonal = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController fruitController = TextEditingController();
  List<String> genderList = ["Male", "Female", "Others"];
  ValueNotifier<int> selectedGenderIndex = ValueNotifier(-1);
  ValueNotifier<bool> genderError = ValueNotifier(false);

  /// Address
  GlobalKey<FormState> formKeyAddress = GlobalKey<FormState>();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  List<String> stateList = ["Tamil Nadu", "Kerala"];
  ValueNotifier<String?> selectedState = ValueNotifier(null);
  final Map<String, List<String>> stateDistrictMap = {
    "Tamil Nadu": [
      "Ariyalur",
      "Chengalpattu",
      "Chennai",
      "Coimbatore",
      "Cuddalore",
      "Dharmapuri",
      "Dindigul",
      "Erode",
      "Kallakurichi",
      "Kanchipuram",
      "Kanniyakumari",
      "Karur",
      "Krishnagiri",
      "Madurai",
      "Nagapattinam",
      "Namakkal",
      "Perambalur",
      "Pudukkottai",
      "Ramanathapuram",
      "Ranipet",
      "Salem",
      "Sivaganga",
      "Tenkasi",
      "Thanjavur",
      "Theni",
      "Thoothukudi",
      "Tiruchirappalli",
      "Tirunelveli",
      "Tirupathur",
      "Tiruppur",
      "Tiruvallur",
      "Tiruvannamalai",
      "Tiruvarur",
      "Vellore",
      "Viluppuram",
      "Virudhunagar"
    ],
    "Kerala": [
      "Alappuzha",
      "Ernakulam",
      "Idukki",
      "Kannur",
      "Kasaragod",
      "Kollam",
      "Kottayam",
      "Kozhikode",
      "Malappuram",
      "Palakkad",
      "Pathanamthitta",
      "Thiruvananthapuram",
      "Thrissur",
      "Wayanad"
    ],
  };

  List<String> get currentDistrictList {
    final state = selectedState.value;
    return state != null ? stateDistrictMap[state] ?? [] : [];
  }

  ValueNotifier<String?> selectedDistrict = ValueNotifier(null);
  List<String> deliveryTimings = [
    "6.00 AM to 9.00 AM",
    "12.00 PM to 2.00 PM",

  ];
  ValueNotifier<int> selectedDeliveryTimingIndex = ValueNotifier(-1);
  ValueNotifier<bool> deliveryTimingError = ValueNotifier(false);
  List<String> addressTypes = [
    "Home",
    "GYM",
    "Office",
    "Others"
  ];
  ValueNotifier<int> selectedAddressTypeIndex = ValueNotifier(-1);
  ValueNotifier<bool> addressTypeError = ValueNotifier(false);


  /// Health
  ValueNotifier<bool?> isPregnant = ValueNotifier(null);
  ValueNotifier<bool?> isAllergies = ValueNotifier(null);



}
