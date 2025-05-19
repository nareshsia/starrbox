import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class CustomDropdownWidget<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String label;
  final String hintText;
  final bool readOnly;
  final String? Function(T?)? validator;

  const CustomDropdownWidget({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    required this.hintText,
    this.readOnly = false, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        SizedBox(height: 0.5.h),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: readOnly ? null : onChanged,
          validator: validator,
          style: Theme.of(context).textTheme.bodyMedium,

          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).cardColor,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
            errorStyle:  TextStyle(
                fontSize: 15.5.sp,
                color: Colors.redAccent,
                fontWeight: FontWeight.normal),
            contentPadding:
            EdgeInsets.only(top: 10.sp, left: 15.sp, right: 15.sp),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            ),
          ),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
        ),
      ],
    );
  }
}

