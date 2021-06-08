import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_controller.dart';

import 'package:registros_aba/app/shared/models/abc_model.dart';
import 'package:registros_aba/app/shared/widgets/appbar_widget.dart';

class AbcDetailsPage extends StatelessWidget {
  final AbcModel currentAbc;

  const AbcDetailsPage({
    Key? key,
    required this.currentAbc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AbcRegisterController controller = Modular.get();
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          leading: BackButton(
            color: Theme.of(context).primaryColor,
          ),
          title: 'Detalhes',
          actions: [
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Modular.to.pushNamed('/edit', arguments: currentAbc);
                }),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  await Hive.box('registers').delete(currentAbc.key);
                  Navigator.pop(context);
                }),
          ],
        ),
        preferredSize: const Size.fromHeight(100),
      ),
      body: Form(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Antecedente: ${currentAbc.antecedent}",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Resposta: ${currentAbc.behavior}",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Consequência: ${currentAbc.consequences}",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              controller.formatDateTime(currentAbc.dateTime),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      )),
    );
  }
}
