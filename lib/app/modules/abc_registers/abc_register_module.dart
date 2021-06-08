import 'package:flutter_modular/flutter_modular.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_details_page.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_edit_page.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_controller.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_list_page.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_page.dart';

class AbcRegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => AbcRegisterController(),
    )
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/add', child: (_, args) => AbcRegisterPage()),
    ChildRoute('/', child: (_, args) => AbcListPage()),
    ChildRoute('/details',
        child: (_, args) => AbcDetailsPage(
              currentAbc: args.data,
            )),
    ChildRoute('/edit',
        child: (_, args) => AbcEditPage(
              currentAbc: args.data,
            ))
  ];
}
