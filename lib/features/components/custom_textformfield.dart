import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? suffixText;
  final String? prefixText;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool? filled, obscure;
  final int? length;
  final double? height;
  final double? width;
  final bool readOnly;
  final FocusNode? node;
  final int? line;
  final TextInputType? keyboardType;
  final AutovalidateMode? autoValidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? onValidate;
  final BorderRadiusGeometry? borderRadiusGeometry;

  final Widget? prefixIcon;
  final String? labelTwo;
  final Color? labelTwoColour;
  final Color? suffixTextColour;
  final void Function(String)? onSubmit;
  final Widget? suffixWidget;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final bool? enableBorder;
  final double? borderRadius;
  final EdgeInsets? contentPadding;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixText,
    this.onChanged,
    this.obscure = false,
    this.onValidate,
    this.length,
    this.width,
    this.height,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.fillColor,
    this.filled,
    required this.readOnly,
    this.autoValidateMode,
    this.borderRadiusGeometry,
    this.node,
    this.line,
    this.prefixText,
    this.labelTwo,
    this.labelTwoColour,
    this.prefixIcon,
    this.onSubmit,
    this.onTap,
    this.suffixTextColour,
    this.suffixWidget,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.enableBorder,
    this.borderRadius,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTwo != null
            ? Column(
                children: [
                  Text(
                    labelTwo!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  )
                ],
              )
            : SizedBox.shrink(),
        TextFormField(
          onTap: onTap,
          focusNode: node,
          readOnly: readOnly,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onFieldSubmitted: onSubmit,
          autovalidateMode: autoValidateMode,
          inputFormatters: inputFormatters,
          maxLines: line,
          maxLength: length,
          style: Theme.of(context).textTheme.bodyMedium,
          cursorColor: Theme.of(context).primaryColor,
          validator: onValidate,
          obscureText: obscure!,
          controller: controller,
          decoration: InputDecoration(
            suffix: suffixWidget,
            counterText: "",
            suffixIcon: suffixIcon,
            suffixText: suffixText,
            suffixStyle: TextStyle(
                fontSize: 15.sp,
                color: suffixTextColour,
                fontWeight: FontWeight.bold),
            prefixText: prefixText,
            prefixIcon: prefixIcon,
            suffixIconConstraints: suffixIconConstraints,
            prefixIconConstraints: prefixIconConstraints,
            filled: true,
            fillColor: Theme.of(context).cardColor,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary
            ),
            errorStyle: TextStyle(
                fontSize: 15.5.sp,
                color: Colors.redAccent,
                fontWeight: FontWeight.normal),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.onSurface),
                borderRadius: BorderRadius.all(Radius.circular(10.sp))),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.onSurface),
                borderRadius: BorderRadius.all(Radius.circular(10.sp))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.onSurface),
                borderRadius: BorderRadius.all(Radius.circular(10.sp))),
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.onSurface),
                borderRadius: BorderRadius.all(Radius.circular(10.sp))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.onSurface),
                borderRadius: BorderRadius.all(Radius.circular(10.sp))),
            contentPadding: contentPadding ??
                EdgeInsets.only(top: 10.sp, left: 15.sp, right: 15.sp),
          ),
        ),
      ],
    );
  }
}
