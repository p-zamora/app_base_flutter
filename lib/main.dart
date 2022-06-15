// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:appbase/core/containers/injection_container.dart' as dependency;
import 'package:appbase/core/containers/Injection_container.dart';
import 'package:appbase/views/bloc/login/login_bloc.dart';
import 'package:appbase/views/bloc/registrar/registrar_bloc.dart';
import 'package:appbase/views/screens/forgotpass_screen.dart';
import 'package:appbase/views/screens/login_screen.dart';
import 'package:appbase/views/screens/registrar_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency.init();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));

    return new AnimatedSplashScreen(
      splashIconSize: 200.0,
      splash: Image(image: AssetImage('assets/img/logo-splash-1-blanco.png')),
      nextScreen: AfterSplash(),
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: Color.fromRGBO(0, 68, 129, 1.0),
      pageTransitionType: PageTransitionType.leftToRight,
      duration: 3000,
      curve: Curves.easeIn,
      animationDuration: Duration(seconds: 2),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => locator<LoginBloc>()),
        BlocProvider(create: (BuildContext context) => locator<RegistrarBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        home: LoginScreen(),
        routes: {
          'login': (BuildContext context) => LoginScreen(),
          'registrar': (BuildContext context) => RegistrarScreen(),
          'forgotpass': (BuildContext context) => ForgotPasswordScreen(),
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), //English
          const Locale('es','ES'),  //Spanish
        ],
        theme: ThemeData(
          textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primaryColor: Color.fromRGBO(71, 152, 255, 1)
        ),
      ),
    );
  }
}
