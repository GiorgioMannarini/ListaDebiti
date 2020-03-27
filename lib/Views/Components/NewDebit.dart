import 'package:flutter/material.dart';
import 'ModalTextField.dart';

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
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 40,
              left: 15,
              right: 20, top: 10),
          child: Column(
            children: <Widget>[
              ModalTextField('Debitore', Icon(Icons.person), controllerDebitore, TextInputType.text),
              SizedBox(
                height: 20,
              ),
              ModalTextField('Motivazione', Icon(Icons.question_answer), controllerMotivazione, TextInputType.text),
              SizedBox(
                height: 20,
              ),
              ModalTextField('Ammontare', Icon(Icons.attach_money), controllerAmount, TextInputType.numberWithOptions(decimal: true)),
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 30,
                child: IconButton(
                    icon: Icon(Icons.arrow_forward), onPressed: ()=> _submitData()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
