import 'package:appbase/views/pages/registrar_page.dart';
import 'package:appbase/views/widgets/backgorund_widget.dart';
import 'package:flutter/material.dart';

class RegistrarScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     return Stack(
      children: [
        BackgorundWidget(image: 'assets/img/login_bg.png'),
        RegistrarPage()
      ],
    );
  }
}