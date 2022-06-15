import 'package:appbase/domain/entities/Usuario.dart';

abstract class IUsuarioRepository {
  Future<Usuario> validateUser(Usuario params);
}