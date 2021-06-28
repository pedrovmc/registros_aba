import 'dart:io';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';
import 'package:registros_aba/app/shared/models/abc_model.dart';

class AbcRegisterController {
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
