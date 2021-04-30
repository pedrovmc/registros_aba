import 'package:intl/intl.dart';

class AbcRegisterController {
  String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }
}
