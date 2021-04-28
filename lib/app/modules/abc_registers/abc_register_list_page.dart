import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_controller.dart';
import 'package:registros_aba/app/shared/models/abc_model.dart';
import 'package:registros_aba/app/shared/widgets/appbar_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AbcListPage extends StatelessWidget {
  var controller = Modular.get<AbcRegisterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          title: "Lista de Registros ABC",
        ),
        preferredSize: const Size.fromHeight(100),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('registers').listenable(),
        builder: (context, Box registers, __) {
          if (registers.values.isEmpty) {
            return Text("Nenhum registro encontrado");
          }
          return ListView.builder(
            itemCount: registers.values.length,
            itemBuilder: (context, index) {
              AbcModel currentAbc = registers.getAt(index);
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Text(currentAbc.antecedent),
                      SizedBox(height: 5),
                      Text(currentAbc.behavior),
                      SizedBox(height: 5),
                      Text(currentAbc.consequences),
                      SizedBox(height: 5),
                      Text(currentAbc.dateTime.toString()),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
