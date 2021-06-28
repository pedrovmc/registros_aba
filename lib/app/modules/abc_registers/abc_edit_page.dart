import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_controller.dart';
import 'package:registros_aba/app/shared/models/abc_model.dart';
import 'package:registros_aba/app/shared/widgets/appbar_widget.dart';

class AbcEditPage extends StatefulWidget {
  final AbcModel currentAbc;
  AbcEditPage({required this.currentAbc});
  @override
  _AbcEditPageState createState() => _AbcEditPageState();
}

class _AbcEditPageState
    extends ModularState<AbcEditPage, AbcRegisterController> {
  final TextEditingController _antecedentController = TextEditingController();
  final TextEditingController _behaviorController = TextEditingController();
  final TextEditingController _consequencesController = TextEditingController();

  final FocusNode _antecedentFocusNode = FocusNode();
  final FocusNode _behaviorFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  final snackBar = SnackBar(content: Text('Registro Salvo'));
  @override
  Widget build(BuildContext context) {
    _antecedentController.text = widget.currentAbc.antecedent;
    _behaviorController.text = widget.currentAbc.behavior;
    _consequencesController.text = widget.currentAbc.consequences;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          title: "Editar Registro ABC",
          leading: BackButton(
            onPressed: () {
              Modular.to.pop();
            },
            color: Theme.of(context).accentColor,
          ),
        ),
        preferredSize: const Size.fromHeight(75),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    focusNode: _antecedentFocusNode,
                    textInputAction: TextInputAction.next,
                    controller: _antecedentController,
                    decoration: InputDecoration(
                      labelText: "Antecedentes",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, digite um antecedente";
                      }
                    },
                  ),
                  TextFormField(
                    focusNode: _behaviorFocusNode,
                    textInputAction: TextInputAction.next,
                    controller: _behaviorController,
                    decoration: InputDecoration(
                      labelText: "Reposta",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, digite uma resposta";
                      }
                    },
                  ),
                  TextFormField(
                    controller: _consequencesController,
                    decoration: InputDecoration(
                      labelText: "Consequência",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, digite uma consequência";
                      }
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        AbcModel abcModel = AbcModel()
                          ..antecedent = _antecedentController.text
                          ..behavior = _behaviorController.text
                          ..consequences = _consequencesController.text
                          ..dateTime = widget.currentAbc.dateTime;
                        await Hive.box('registers')
                            .put(widget.currentAbc.key, abcModel);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        _antecedentController.clear();
                        _behaviorController.clear();
                        _consequencesController.clear();
                        _antecedentFocusNode.requestFocus();
                        Modular.to.popUntil(ModalRoute.withName('/'));
                      }
                    },
                    child: Text("Salvar e Voltar a Lista"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
