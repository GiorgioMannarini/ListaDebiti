import 'package:flutter/material.dart';
import 'package:lista_debiti/Models/Debit.dart';

class DebitCard extends StatelessWidget {
  final Debit debit;
  final Function deleteDebit;

  DebitCard(this.debit, this.deleteDebit);
  //TODO: FUNZIONE PER ELIMINARE DEBITO DAL DATABASE
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        semanticContainer: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Center(
          child: ListTile(
            title: Text(debit.debName),
            leading: Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).accentColor)),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: FittedBox(
                  child: Text(
                    '€${debit.amount.toString()}',
                    style: TextStyle(color: Theme.of(context).primaryColorDark),
                  ),
                ),
              ),
            ),
            subtitle: Text(debit.title),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteDebit(this.debit),
            ),
          ),
        ),
      ),
    );
  }
}
