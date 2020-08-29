import 'dart:convert';

import 'package:flutter/material.dart';
import '../Components/ChartContainer.dart';
import '../Components/ActionsContainer.dart';
import '../../Controllers/FirstScreenController.dart';
import '../Components/ContainerButton.dart';
import '../Components/NewDebit.dart';
import '../../Models/Debit.dart';
import '../Components/DebitCard.dart';

//TODO: AL CARICAMENTO DELLA SCHERMATA DEVE PRENDERE I DATI DAL DB E ALL'AGGIUNTA DEL DEBITO DEVE SALVARLO
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final FirstScreenController firstScreenController = FirstScreenController();
  bool selected = false;
  List<Debit> _debiti = List<Debit>();
  bool loadingFinished = false;
  //prendo la lista dei debiti
  Future _getDebits() async {
    firstScreenController.getCurrentUser().then((user) {
      if (user != null) {
        firstScreenController.getNewToken().then((token) {
          firstScreenController.sendLogin(token).then((res) {
            //il server ha risposto sul login ed è andato a buon fine
            if (res == true) {
              firstScreenController.getListaDebiti(token).then((res) {
                if (res != false) {
                  res = jsonDecode(res);
                  _debiti = [];
                  

                  for (int i = 0; i < res.length; i++) {
                    var elem = res[i];

                    String title = elem['reason'];
                    double amount = double.parse(elem['amount']);
                    String debName = elem['debtor_name'];
                    int timestamp = elem['timestamp'];

                    Debit deb = new Debit(
                        title: title,
                        amount: amount,
                        debName: debName,
                        timestamp: timestamp);
                    _debiti.add(deb);
                  }

                  setState(() {
                    loadingFinished = true;
                  });
                }
              });
            }
          });
        });
      }
    });
  }

  void initState() {
    super.initState();
    _getDebits();
  }

  void addDebit(Debit deb) {
    setState(() {
      _debiti.add(deb);
    });
  }

  void deleteDebit(Debit deb) {
    firstScreenController.getCurrentUser().then((user) {
      if (user != null) {
        firstScreenController.getNewToken().then((token) {
          firstScreenController.sendLogin(token).then((res) {
            //il server ha risposto sul login ed è andato a buon fine
            if (res == true) {
              firstScreenController.deleteDebit(deb, token).then((res) {
                if (res == true) {
                  setState(() {
                    _debiti.remove(deb);
                  });
                }
              });
            }
          });
        });
      }
    });
  }

  void _showBottom(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        builder: (_) {
          return NewDebit(addDebit);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Lista Debiti',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xffdfe4ea)),
          ),
          Column(
            children: <Widget>[
              ChartContainer(selected),
              ActionsContainer(
                child: Row(
                  children: <Widget>[
                    ContainerButton(
                        "Expand",
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        Theme.of(context).primaryColorDark, () {
                      setState(() {
                        selected = !selected;
                      });
                    }),
                    ContainerButton(
                        "Settings",
                        Icon(Icons.exit_to_app, color: Colors.white),
                        Theme.of(context).primaryColorDark, () {
                      print('Settings');
                    }),
                    ContainerButton(
                        "Logout",
                        Icon(Icons.exit_to_app, color: Colors.white),
                        Theme.of(context).primaryColorDark, () {
                      firstScreenController.logoutButton(context);
                    }),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: loadingFinished
                      ? RefreshIndicator(
                          child: ListView.builder(
                            itemBuilder: (_, ind) {
                              return DebitCard(_debiti[ind], deleteDebit);
                            },
                            itemCount: _debiti.length,
                          ),
                          onRefresh: _getDebits,
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showBottom(context),
        elevation: 5,
        backgroundColor: Theme.of(context).primaryColorDark,
        splashColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
