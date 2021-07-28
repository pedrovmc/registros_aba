import 'package:flutter/material.dart';
import 'package:registros_aba/app/shared/widgets/appbar_widget.dart';

class PatientCreationPage extends StatefulWidget {
  const PatientCreationPage({Key? key}) : super(key: key);

  @override
  _PatientCreationPageState createState() => _PatientCreationPageState();
}

class _PatientCreationPageState extends State<PatientCreationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Cadastrar Paciente",
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              RawMaterialButton(
                fillColor: Colors.black12,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black26,
                    size: 100,
                  ),
                ),
                shape: CircleBorder(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Definir foto de perfil",
                style: TextStyle(color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  validator: (text) {
                    if (text == null || text.isEmpty)
                      return "Digite o nome do paciente";
                  },
                  decoration: InputDecoration(labelText: "Nome do Paciente"),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 200, minHeight: 46),
                child: ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: Text(
                    "Cadastrar",
                  ),
                ),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
