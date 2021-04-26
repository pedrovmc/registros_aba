import 'package:flutter/material.dart';
import 'package:registros_aba/app/core/appbar_widget.dart';

class AbcRegisterPage extends StatelessWidget {
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
                    decoration: InputDecoration(
                      labelText: "Antecedentes",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Reposta",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Consequência",
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
