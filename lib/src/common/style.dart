import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonStyle {
  static InputDecoration outlineTextFieldStyle(
      {String? lable = "",
      String? hintText = "",
      required BuildContext context}) {
    return InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).primaryColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).errorColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).errorColor)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: Theme.of(context).hintColor),
        labelText: lable,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(fontWeight: FontWeight.w500),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }

  static InputDecoration outlineDropdownButton(
      {String lable = '',
      required BuildContext context,
      Color? fillColor,
      InputBorder? border}) {
    return InputDecoration(
        filled: true,
        fillColor: fillColor ?? Theme.of(context).backgroundColor,
        label: Text(
          lable,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        border: border ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
        enabledBorder: border ??
            const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(width: 0)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1));
  }

  static InputDecoration passwordTextFormField(
      {bool obsecureText = true,
      required VoidCallback toggle,
      String? hintText = '',
      String? lable = '',
      required BuildContext context}) {
    return InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 6),
          child: IconButton(
            onPressed: toggle,
            icon: Icon(
              obsecureText ? Icons.visibility_off : Icons.remove_red_eye,
              size: 18,
              color: Theme.of(context).canvasColor,
            ),
            splashRadius: 20,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).primaryColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).errorColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).errorColor)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: Theme.of(context).hintColor),
        labelText: lable,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(fontWeight: FontWeight.w500),
        floatingLabelBehavior: FloatingLabelBehavior.always);
  }

  static ButtonStyle containedButtonStyle(
      {EdgeInsets? padding,
      required BuildContext context,
      Color? backgroundColor,
      BorderRadiusGeometry? borderRadius}) {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(30),
        )),
        backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? Theme.of(context).primaryColor),
        padding: MaterialStateProperty.all<EdgeInsets>(
            padding ?? const EdgeInsets.all(8)));
  }

  static ButtonStyle outlinedButtonStyle(
      {Color? borderColor,
      required BuildContext context,
      EdgeInsets? padding}) {
    return ButtonStyle(
      padding:
          MaterialStateProperty.all<EdgeInsets>(padding ?? const EdgeInsets.all(8)),
      textStyle: MaterialStateProperty.all<TextStyle>(
          Theme.of(context).textTheme.button?.copyWith(color: borderColor) ??
              TextStyle(fontSize: 14, color: borderColor)),
      backgroundColor:
          MaterialStateProperty.all<Color>(Theme.of(context).backgroundColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
              color: borderColor ?? Theme.of(context).errorColor, width: 1))),
    );
  }

  static InputDecoration searchBarStyle(
      {required BuildContext context, String? hintText}) {
    return InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(15, 4, 0, 12),
        border: InputBorder.none,
        hintText: hintText ?? 'find'.tr,
        hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: Theme.of(context).hintColor, fontWeight: FontWeight.normal),
        suffixIcon: const Icon(Icons.search),
        suffixIconColor: Theme.of(context).canvasColor,
        focusColor: Theme.of(context).canvasColor);
  }
}
