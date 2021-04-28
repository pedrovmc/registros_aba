import 'package:flutter_modular/flutter_modular.dart';

import 'modules/abc_registers/abc_register_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AbcRegisterModule()),
  ];
}
