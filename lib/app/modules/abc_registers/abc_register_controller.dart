import 'dart:io';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:registros_aba/app/shared/models/abc_model.dart';

class AbcRegisterController {
  List<String?> findAntecedent(String query) {
    final List<String> antecedents = [];
    final allModels = Hive.box('registers').values.toList();
    allModels.forEach((e) {
      if (e.antecedent.contains(query)) {
        antecedents.add(e.antecedent);
      }
    });
    return antecedents.toSet().toList();
  }

  List<String?> findBehavior(String query) {
    final List<String> behaviors = [];
    final allModels = Hive.box('registers').values.toList();
    allModels.forEach((e) {
      if (e.behavior.contains(query)) {
        behaviors.add(e.behavior);
      }
    });
    return behaviors.toSet().toList();
  }

  List<String?> findConsequences(String query) {
    final List<String> consequences = [];
    final allModels = Hive.box('registers').values.toList();
    allModels.forEach((e) {
      if (e.consequences.contains(query)) {
        consequences.add(e.consequences);
      }
    });
    return consequences.toSet().toList();
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }

  String formatDateTimeToFile(DateTime dateTime) {
    return DateFormat('dd.MM.yyyy HH:mm').format(dateTime);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> deleteFiles() async {
    var _path = await _localPath;
    final dir = Directory("$_path/registers");
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
  }

  exportSheet() async {
    await deleteFiles();
    final excel = Excel.createExcel();
    excel.rename('Sheet1', 'Registros ABC');
    final registerSheet = excel['Registros ABC'];
    registerSheet
        .appendRow(['Data', 'Antecedentes', 'Reposta', 'Consequências']);
    final currentRegisters =
        Hive.box('registers').values.toList().cast<AbcModel>();
    currentRegisters.forEach((element) {
      registerSheet.appendRow([
        formatDateTime(element.dateTime),
        element.antecedent,
        element.behavior,
        element.consequences
      ]);
    });

    var fileBytes = excel.save();
    var directory = await getApplicationDocumentsDirectory();
    String actualDate = formatDateTimeToFile(DateTime.now());
    final filePath =
        "${directory.path}/registers/Registros Aba ($actualDate).xlsx";
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);

    Share.shareFiles([filePath]);
  }
}
