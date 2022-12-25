import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final void Function()? onSuffixIconTap;
  final void Function(String)? onChanged;
  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  const SearchBarWidget(
      {super.key, required this.onSuffixIconTap, this.hint, this.suffixIcon, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyText2,
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          filled: true,
          fillColor: Theme.of(context).canvasColor.withOpacity(0.6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).hintColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          hintText: hint ?? 'Tìm kiếm sự kiện',
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: Theme.of(context).hintColor,
          ),
          prefixIconColor: Theme.of(context).canvasColor,
          suffixIcon: IconButton(
            padding: const EdgeInsets.only(right: 8),
            icon: suffixIcon ??
                const Icon(
                  Icons.filter_list,
                  size: 30,
                ),
            onPressed: onSuffixIconTap,
          )),
    );
  }
}
