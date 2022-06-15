// ignore_for_file: file_names,ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables


import 'package:appbase/domain/entities/MessageError.dart';

class Usuario {
  String? id;
  String? token;
  MessageError? message;

  Usuario({this.id, this.token, this.message});

  Map<String, dynamic> toJson() => {
    'id' : id
  };

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
    );
  }

  factory Usuario.fromJsonError(Map<String, dynamic> json) {
    return Usuario(
      message: MessageError.fromJson(json['message']),
    );
  }
}
