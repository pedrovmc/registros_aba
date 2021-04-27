import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_controller.dart';
import 'package:registros_aba/app/shared/models/abc_model.dart';
import 'package:registros_aba/app/shared/widgets/appbar_widget.dart';

class AbcRegisterPage extends StatefulWidget {
  @override
  _AbcRegisterPageState createState() => _AbcRegisterPageState();
}

class _AbcRegisterPageState
    extends ModularState<AbcRegisterPage, AbcRegisterController> {
  TextEditingController antecedentController = TextEditingController();
  TextEditingController behaviorController = TextEditingController();
  TextEditingController consequencesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          title: "Novo Registro ABC",
          leading: BackButton(
            color: Theme.of(context).accentColor,
          ),
        ),
        preferredSize: const Size.fromHeight(100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: antecedentController,
                    decoration: InputDecoration(
                      labelText: "Antecedentes",
                    ),
                  ),
                  TextFormField(
                    controller: behaviorController,
                    decoration: InputDecoration(
                      labelText: "Reposta",
                    ),
                  ),
                  TextFormField(
                    controller: consequencesController,
                    decoration: InputDecoration(
                      labelText: "Consequência",
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      AbcModel abcModel = AbcModel()
                        ..antecedent = antecedentController.text
                        ..behavior = behaviorController.text
                        ..consequences = consequencesController.text
                        ..dateTime = DateTime.now();
                      controller.registerRepository.insert(abcModel);
                    },
                    child: Text("Salvar"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Salvar e Continuar Narrativa",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
