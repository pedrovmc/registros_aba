import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hive/hive.dart';
import 'package:registros_aba/app/modules/abc_registers/abc_register_controller.dart';
import 'package:registros_aba/app/shared/models/abc_model.dart';
import 'package:registros_aba/app/shared/widgets/appbar_widget.dart';

class AbcRegisterPage extends StatefulWidget {
  @override
  _AbcRegisterPageState createState() => _AbcRegisterPageState();
}

class _AbcRegisterPageState
    extends ModularState<AbcRegisterPage, AbcRegisterController> {
  final TextEditingController _antecedentController = TextEditingController();
  final TextEditingController _behaviorController = TextEditingController();
  final TextEditingController _consequencesController = TextEditingController();

  final FocusNode _antecedentFocusNode = FocusNode();
  final FocusNode _behaviorFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  final snackBar = SnackBar(content: Text('Registro Salvo'));
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
                  TypeAheadFormField<String?>(
                    textFieldConfiguration: TextFieldConfiguration(
                      focusNode: _antecedentFocusNode,
                      textInputAction: TextInputAction.next,
                      controller: _antecedentController,
                      decoration: InputDecoration(
                        labelText: "Antecedentes",
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, digite um antecedente";
                      }
                    },
                    itemBuilder: (context, String? suggestion) {
                      return ListTile(
                        title: Text(suggestion!),
                      );
                    },
                    suggestionsCallback: (pattern) {
                      return controller.findAntecedent(pattern);
                    },
                    onSuggestionSelected: (String? suggestion) {
                      _antecedentController.text = suggestion!;
                    },
                    noItemsFoundBuilder: (context) {
                      return SizedBox(
                        width: 0,
                        height: 0,
                      );
                    },
                  ),
                  TypeAheadFormField<String?>(
                    textFieldConfiguration: TextFieldConfiguration(
                      focusNode: _behaviorFocusNode,
                      textInputAction: TextInputAction.next,
                      controller: _behaviorController,
                      decoration: InputDecoration(
                        labelText: "Reposta",
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, digite uma resposta";
                      }
                    },
                    itemBuilder: (context, String? suggestion) {
                      return ListTile(
                        title: Text(suggestion!),
                      );
                    },
                    suggestionsCallback: (pattern) {
                      return controller.findBehavior(pattern);
                    },
                    onSuggestionSelected: (String? suggestion) {
                      _behaviorController.text = suggestion!;
                    },
                    noItemsFoundBuilder: (context) {
                      return SizedBox(
                        width: 0,
                        height: 0,
                      );
                    },
                  ),
                  TypeAheadFormField<String?>(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _consequencesController,
                      decoration: InputDecoration(
                        labelText: "Consequência",
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, digite uma consequência";
                      }
                    },
                    itemBuilder: (context, String? suggestion) {
                      return ListTile(
                        title: Text(suggestion!),
                      );
                    },
                    suggestionsCallback: (pattern) {
                      return controller.findConsequences(pattern);
                    },
                    onSuggestionSelected: (String? suggestion) {
                      _consequencesController.text = suggestion!;
                    },
                    noItemsFoundBuilder: (context) {
                      return SizedBox(
                        width: 0,
                        height: 0,
                      );
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
                          ..dateTime = DateTime.now();
                        await Hive.box('registers').add(abcModel);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        _antecedentController.clear();
                        _behaviorController.clear();
                        _consequencesController.clear();
                        _antecedentFocusNode.requestFocus();
                      }
                    },
                    child: Text("Salvar"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        AbcModel abcModel = AbcModel()
                          ..antecedent = _antecedentController.text
                          ..behavior = _behaviorController.text
                          ..consequences = _consequencesController.text
                          ..dateTime = DateTime.now();
                        await Hive.box('registers').add(abcModel);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        _antecedentController.text =
                            _consequencesController.text;
                        _behaviorController.clear();
                        _consequencesController.clear();
                        _behaviorFocusNode.requestFocus();
                      }
                    },
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
