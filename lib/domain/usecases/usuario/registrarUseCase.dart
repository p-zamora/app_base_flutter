// ignore_for_file: file_names,ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:appbase/core/usecases/UseCase.dart';
import 'package:appbase/domain/entities/Usuario.dart';
import 'package:appbase/domain/repositories/IUsuarioRepository.dart';

class RegistrarUseCase implements UseCase<Usuario, Usuario> {
  final IUsuarioRepository usuarioRepository;

  RegistrarUseCase({required this.usuarioRepository});

  @override
  Future<Usuario> call(Usuario params) async{
    return await usuarioRepository.validateUser(params);
  }

}