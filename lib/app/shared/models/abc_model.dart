import 'package:hive/hive.dart';
import 'package:registros_aba/app/shared/models/register_interface.dart';

part 'abc_model.g.dart';

@HiveType(typeId: 0)
class AbcModel extends HiveObject implements IRegister {
  @HiveField(0)
  late String antecedent;

  @HiveField(1)
  late String behavior;

  @HiveField(2)
  late String consequences;

  @HiveField(3)
  late DateTime dateTime;
}
