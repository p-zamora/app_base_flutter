import 'package:appbase/views/pages/login_page.dart';
import 'package:appbase/views/widgets/backgorund_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgorundWidget(image: 'assets/img/login_bg.png'),
        LoginPage()
      ],
    );
  }

}
