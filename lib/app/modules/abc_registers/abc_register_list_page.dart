import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_controller.dart';
import 'package:registros_aba/app/shared/models/abc_model.dart';
import 'package:registros_aba/app/shared/widgets/appbar_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AbcListPage extends StatelessWidget {
  final AbcRegisterController controller = Modular.get();
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
              return Dismissible(
                key: Key(index.toString()),
                background: Container(
                  padding: EdgeInsets.only(left: 30),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                  color: Colors.red[300],
                ),
                secondaryBackground: Container(
                  padding: EdgeInsets.only(right: 30),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 30,
                  ),
                  color: Colors.yellow[300],
                ),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text(currentAbc.antecedent),
                        SizedBox(height: 5),
                        Text(
                          currentAbc.behavior,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(currentAbc.consequences),
                        SizedBox(height: 5),
                        Align(
                          child: Text(
                            controller.formatDateTime(currentAbc.dateTime),
                            style: TextStyle(color: Colors.black54),
                          ),
                          alignment: Alignment.bottomRight,
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
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
