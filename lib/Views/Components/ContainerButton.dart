

import 'package:flutter/material.dart';


class ContainerButton extends StatelessWidget {
    String buttonTitle;
    Icon icon;
    Color color;
    VoidCallback onIconPress;
    //constructor
    ContainerButton(String buttonTitle, Icon icon, Color color, VoidCallback onIconPress){
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
        width: 2,
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