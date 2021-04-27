import 'package:hive/hive.dart';
import 'package:registros_aba/app/shared/models/register_interface.dart';

class RegisterRepository {
  final registersBox = Hive.box('registers');

  Future<void> insert(IRegister model) async {
    await registersBox.add(model);
  }

  // Future<IRegister> get(int index) async {
  //   return await registersBox.getAt(index);
  // }

  // Future<void> update(int index, IRegister model) async {
  //   return await registersBox.putAt(index, model);
  // }

  // Future<void> delete(index) async {
  //   return await registersBox.deleteAt(index);
  // }
}
