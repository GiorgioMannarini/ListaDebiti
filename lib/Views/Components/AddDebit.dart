import 'package:flutter/material.dart';

class NewDebit extends StatefulWidget {
  final Function addDebit;

  NewDebit(this.addDebit);

  @override
  _NewDebitState createState() => _NewDebitState();
}

class _NewDebitState extends State<NewDebit> {
  final controllerDebitore = TextEditingController();

  final controllerAmount = TextEditingController();

  final controllerMotivazione = TextEditingController();

  void _submitData() {
    final debitore = controllerDebitore.text;
    final amount = double.parse(controllerAmount.text);
    final motivazione = controllerMotivazione.text;
    if (debitore.isEmpty || motivazione.isEmpty || amount <= 0) {
      return;
    }
    widget.addDebit(motivazione, amount, debitore);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(labelText: 'Debitore'),
                    controller: controllerDebitore,
                    ),
                TextField(
                    decoration: InputDecoration(labelText: 'Motivo'),
                    controller: controllerMotivazione,
                    ),
                TextField(
                  decoration: InputDecoration(labelText: 'Ammontare'),
                  controller: controllerAmount,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),

                ),
                SizedBox(
                  height: 40,

                ),
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () => _submitData(),
                  ),
                )
              ],
            ),
          ),
      ),
      );
  }
}