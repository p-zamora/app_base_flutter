// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last

import 'package:appbase/views/pages/forgotpass_page.dart';
import 'package:appbase/views/widgets/backgorund_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return Stack(
      children: [
        BackgorundWidget(image: 'assets/img/login_bg.png'),
        ForgotPasswordPage()
      ],
    );
  }
}