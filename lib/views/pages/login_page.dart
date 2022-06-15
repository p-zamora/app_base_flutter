// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last

import 'package:appbase/views/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:appbase/views/bloc/login/login_bloc.dart';
import 'package:appbase/views/themes/pallete.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;

  final _emailController = new TextEditingController();
  final _passWordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passWordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {}

        if (state.isSuccess) {}
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.isLoading) {}

          return _crearBody(state);
        },
      ),
    );
  }

  Widget _crearBody(LoginState state) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Flexible(
              child: Center(
            child: Text(
              'Foodybite',
              style: TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextInputWidget(
                  icon: FontAwesomeIcons.envelope,
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next),
              TextInputWidget(
                  icon: FontAwesomeIcons.lock,
                  hint: 'Password',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.done),
              GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'forgotpass'),
                  child: Text('Forgot Password', style: kBodyText)),
              SizedBox(height: 25.0),
              crearButton('Login'),
              SizedBox(height: 25.0),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'registrar'),
            child: Container(
              child: Text(
                'Create New Account',
                style: kBodyText,
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: kWhite))),
            ),
          ),
          SizedBox(height: 20.0)
        ],
      ),
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

  void _onEmailChanged() {
    _loginBloc.add(OnChangeEmail(_emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(OnChangePassword(_passWordController.text));
  }
}
