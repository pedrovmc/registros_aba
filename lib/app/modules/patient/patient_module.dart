import 'package:flutter_modular/flutter_modular.dart';
import 'package:registros_aba/app/modules/patient/patient_creation_page.dart';

class PatientModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PatientCreationPage())
  ];
}
