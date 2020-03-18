import 'package:flutter/material.dart';

class ActionsContainer extends StatelessWidget {
  final Widget child;

  ActionsContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Colors.grey[300],
              spreadRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(41),
          color: Colors.white,
        ),
        child: child);
  }
}
