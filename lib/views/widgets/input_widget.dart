// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:appbase/views/themes/pallete.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction inputAction;

  TextInputWidget({
    required this.icon, 
    required this.hint, 
    this.inputType, 
    required this.inputAction});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.grey[500]!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    icon,
                    size: 28.0,
                    color: kWhite,
                  ),
                ),
                hintText: hint,
                hintStyle: kBodyText,
              ),
              obscureText: true,
              style: kBodyText,
              keyboardType: inputType,
              textInputAction: inputAction,
            ),
          )),
    );
  }
}
