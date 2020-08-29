import 'package:flutter/material.dart';
import 'ModalTextField.dart';
import '../../Controllers/FirstScreenController.dart';
import '../../Models/Debit.dart';

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

  final FirstScreenController firstScreenController = FirstScreenController();

  bool sent = false;

  void _submitData() {
    
    final debitore = controllerDebitore.text.trimRight();
    final amount = double.parse(controllerAmount.text.trimRight());
    final motivazione = controllerMotivazione.text.trimRight();
    
    if (debitore.isEmpty || motivazione.isEmpty || amount <= 0) {
      return;
    // } else if (debitore == "Valentina" &&
    //     motivazione == "Vale" &&
    //     amount == 1123) {
    //   // Navigator.pushNamed(context, '/easterEgg');
    //   return;
    }
    setState(() {
      sent = true;
    });
    final t = DateTime.now().millisecondsSinceEpoch;
    Debit newDeb = Debit(amount: amount, title: motivazione, debName: debitore, timestamp: t);

    firstScreenController.getCurrentUser().then((user) {
      if (user != null) {
        firstScreenController.getNewToken().then((token) {
          firstScreenController.sendLogin(token).then((res) {
            //il server ha risposto sul login ed è andato a buon fine
            if (res == true) {
              print('post');
              firstScreenController.postDebit(newDeb, token).then((res) {
                //se il POST è andato a buon fine
                if (res == true) {
                  widget.addDebit(newDeb);
                  Navigator.of(context).pop();
                }
                //il server ha risposto ma c'è stato un problema
                else {
                  Navigator.of(context).pop();
                }
              }).catchError((error) {
                //il server non ha risposto sul POST
                Navigator.of(context).pop();
              });
            }
            //il server ha risposto sul login ma c'è stato un problema
            else {
              Navigator.of(context).pop();
            }
            //il server non ha risposto sul login
          }).catchError((error) {
            Navigator.of(context).pop();
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 40,
                left: 15,
                right: 20,
                top: 10),
            child: Column(
              children: <Widget>[
                ModalTextField('Debitore', Icon(Icons.person),
                    controllerDebitore, TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                ModalTextField('Motivazione', Icon(Icons.question_answer),
                    controllerMotivazione, TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                ModalTextField(
                    'Ammontare',
                    Icon(Icons.attach_money),
                    controllerAmount,
                    TextInputType.numberWithOptions(decimal: true)),
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  backgroundColor:
                      sent ? Colors.white : Theme.of(context).primaryColorDark,
                  radius: 30,
                  child: sent
                      ? CircularProgressIndicator()
                      : IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onPressed: () => _submitData()),
                ),
              ],
            )),
      ),
    );
  }
}
