import 'package:flutter/material.dart';

class ModalTextField extends StatelessWidget {
  String description;
  Icon icon;
  TextEditingController controller;
  TextInputType keyboard;

  ModalTextField(
      String description, Icon icon, TextEditingController controller, TextInputType keyboard) {
    this.description = description;
    this.icon = icon;
    this.controller = controller;
    this.keyboard = keyboard;
  }



  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColorDark)),
          labelText: this.description,
          labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
          icon: this.icon,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10))),
      controller: this.controller,
      cursorColor: Theme.of(context).primaryColorDark,
      cursorRadius: Radius.circular(16),
      showCursor: true,
      keyboardType: this.keyboard,
    );
  }
}
