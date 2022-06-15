import 'package:appbase/domain/usecases/usuario/registrarUseCase.dart';
import 'package:appbase/views/bloc/registrar/registrar_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:appbase/core/network/networkInfo.dart';
import 'package:appbase/core/network/networkInfoImpl.dart';
//import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/http.dart' as http;

import 'package:appbase/views/bloc/login/login_bloc.dart';
import 'package:appbase/domain/usecases/usuario/loginUseCase.dart';
import 'package:appbase/domain/repositories/IUsuarioRepository.dart';
import 'package:appbase/data/repositories/UsuarioRepository.dart';
import 'package:appbase/data/datasources/remote/usuario/IUsuarioService.dart';
import 'package:appbase/data/datasources/remote/usuario/UsuarioService.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';




GetIt locator = GetIt.instance;

Future<void> init() async{
  // Registering Blocs
  locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => RegistrarBloc(locator()));

  // Registering Use Case
  locator.registerLazySingleton(() => LoginUseCase(usuarioRepository: locator()));
  locator.registerLazySingleton(() => RegistrarUseCase(usuarioRepository: locator()));

  // Registering Repositories
  locator.registerLazySingleton<IUsuarioRepository>(() => UsuarioRepository(usuarioService: locator()));

  // Registering Datasources
  locator.registerLazySingleton<IUsuarioService>(() => UsuarioService(client: locator()));

  //Registering Core
  locator.registerLazySingleton<NetWorkInfo>(() => NetWorkInfoImpl(connectionChecker: locator()));
  
  //External Components
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => InternetConnectionChecker());

}