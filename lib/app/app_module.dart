import 'package:flutter_modular/flutter_modular.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_page.dart';
import 'package:registros_aba/app/modules/home/home_page.dart';
import 'package:registros_aba/app/shared/repositories/registers_respository.dart';

import 'modules/abc_registers/abc_register_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind((i) => RegisterRepository()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AbcRegisterModule()),
  ];
}
