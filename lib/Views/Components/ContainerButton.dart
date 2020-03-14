

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerButton extends StatelessWidget {
    String buttonTitle;
    FaIcon icon;
    Color color;
    VoidCallback onIconPress;
    ContainerButton(String buttonTitle, FaIcon icon, Color color, VoidCallback onIconPress){
      this.icon = icon; 
      this. buttonTitle = buttonTitle;
      this.color = color;
      this.onIconPress = onIconPress;
    }
  @override
  Widget build(BuildContext context) {
    return 
    SizedBox.fromSize(
  size: Size(70, 70), // button width and height
  child: Container(
    
   
    
    decoration: BoxDecoration(
      border: Border.all(
        color: color, 
        width: 3,
      ), 
      borderRadius: BorderRadius.circular(40)
    ),
    child: ClipOval(
      
          child: Material(
            
        
        color: Colors.white, // button color
        child: InkWell(
          splashColor: Colors.green, // splash color
          onTap: () {onIconPress();}, // button pressed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon, // icon
              Text(buttonTitle), // text
            ],
          ),
        ),
      ),
    ),
  ),
);
      
    
  }
}