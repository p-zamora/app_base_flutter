// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last

import 'dart:ui';
import 'package:appbase/views/themes/pallete.dart';
import 'package:appbase/views/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:appbase/views/bloc/registrar/registrar_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistrarPage extends StatefulWidget {
  @override
  _RegistrarPageState createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  late RegistrarBloc _registrarBloc;

  final _userController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _phoneontroller = new TextEditingController();
  final _passWordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _registrarBloc = BlocProvider.of<RegistrarBloc>(context);
    _userController.addListener(_onUserChanged);
    _emailController.addListener(_onEmailChanged);
    _phoneontroller.addListener(_onPhoneChanged);
    _passWordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrarBloc, RegistrarState>(
      listener: (context, state) {
        if (state.isFailure) {}

        if (state.isSuccess) {}
      },
      child: BlocBuilder<RegistrarBloc, RegistrarState>(
        builder: (context, state) {
          if (state.isLoading) {}

          return _crearBody(state);
        },
      ),
    );
  }

  Widget _crearBody(RegistrarState state) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.width * 0.1),
              Stack(
                children: [
                  Center(
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 3,
                          sigmaY: 3
                        ),
                        child: CircleAvatar(
                          radius: size.width * 0.14,
                          backgroundColor: Colors.grey[400]!.withOpacity(0.4),
                          child: Icon(
                            FontAwesomeIcons.user,
                            color: kWhite,
                            size: size.width * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.08,
                    left: size.width * 0.56,
                    child: Container(
                      height: size.width * 0.1,
                      width: size.width * 0.1,
                      decoration: BoxDecoration(
                        color: kBlue,
                        shape: BoxShape.circle,
                        border: Border.all(color: kWhite, width: 2)
                      ),
                      child: Icon(
                        FontAwesomeIcons.arrowUp,
                        color: kWhite
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.width * 0.1
              ),
              Column(
                children: [
                  TextInputWidget(
                    icon: FontAwesomeIcons.user, 
                    hint: 'User',
                    inputType: TextInputType.name, 
                    inputAction: TextInputAction.next
                  ),
                  TextInputWidget(
                    icon: FontAwesomeIcons.envelope, 
                    hint: 'Email',
                    inputType: TextInputType.emailAddress, 
                    inputAction: TextInputAction.next
                  ),
                  TextInputWidget(
                    icon: FontAwesomeIcons.lock, 
                    hint: 'Password',
                    inputAction: TextInputAction.next
                  ),
                  TextInputWidget(
                    icon: FontAwesomeIcons.lock, 
                    hint: 'Confirm Password',
                    inputAction: TextInputAction.done
                  ),
                  SizedBox(height: 25.0),
                  crearButton('Registrar'),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?', style: kBodyText),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'login'),
                        child: Text('Login', style: kBodyText.copyWith(color: kBlue, fontWeight: FontWeight.bold ))
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0)
                ],
              )
            ],
          ),
        )
     );
  }

  Widget crearButton(String name) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: kBlue),
      child: TextButton(
        onPressed: () {},
        child: Text(
          name,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
 

  void _onUserChanged() {
    _registrarBloc.add(OnChangeUser(_userController.text));
  }

  void _onEmailChanged() {
    _registrarBloc.add(OnChangeEmail(_emailController.text));
  }

  void _onPhoneChanged() {
    _registrarBloc.add(OnChangePhone(_phoneontroller.text));
  }

  void _onPasswordChanged() {
    _registrarBloc.add(OnChangePassword(_passWordController.text));
  }
}
