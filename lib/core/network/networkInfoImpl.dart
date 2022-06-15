// ignore_for_file: file_names,ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:appbase/core/network/networkInfo.dart';
//import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetWorkInfoImpl implements NetWorkInfo{
  final InternetConnectionChecker connectionChecker;

  NetWorkInfoImpl({required this.connectionChecker});

  @override 
  Future<bool> get isConnected => connectionChecker.hasConnection;

}