import 'package:appbase/views/themes/pallete.dart';
import 'package:appbase/views/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: kWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Forgot Password',
          style: kBodyText,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            Container(
              width: size.width * 0.8,
              child: Text(
                'Enter your email we will send instruction to reset your password',
                style: kBodyText,
              ),
            ),
            SizedBox(height: 20.0),
            TextInputWidget(
                icon: FontAwesomeIcons.envelope,
                hint: 'Email',
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.done),
            SizedBox(height: 20.0),
            crearButton('Send', size)
          ],
        ),
      ),
    );
  }

  Widget crearButton(String name, Size size) {
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: kBlue),
      child: FlatButton(
        onPressed: () {},
        child: Text(
          name,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
