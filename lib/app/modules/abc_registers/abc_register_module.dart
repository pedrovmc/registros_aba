import 'package:flutter_modular/flutter_modular.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_controller.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_page.dart';
import 'package:registros_aba/app/shared/repositories/registers_respository.dart';

class AbcRegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => AbcRegisterController(
        registerRepository: i.get<RegisterRepository>(),
      ),
    )
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AbcRegisterPage())
  ];
}
