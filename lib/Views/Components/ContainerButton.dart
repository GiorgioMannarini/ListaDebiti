import 'package:flutter/material.dart';

//TODO: Clipoval Color and Colors in general
class ContainerButton extends StatelessWidget {
  String buttonTitle;
  Icon icon;
  Color color;
  VoidCallback onIconPress;
  //constructor
  ContainerButton(
      String buttonTitle, Icon icon, Color color, VoidCallback onIconPress) {
    this.icon = icon;
    this.buttonTitle = buttonTitle;
    this.color = color;
    this.onIconPress = onIconPress;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(70, 70), // button width and height
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40)),
        child: ClipOval(
          child: Material(
            color: color, // button color
            child: InkWell(
              splashColor: Theme.of(context).primaryColor, // splash color
              onTap: () {
                onIconPress();
              }, // button pressed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  icon,
                  SizedBox(
                    height: 3,
                  ), // icon
                  Text(
                    buttonTitle,
                    style: TextStyle(color: Colors.white),
                  ), // text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}