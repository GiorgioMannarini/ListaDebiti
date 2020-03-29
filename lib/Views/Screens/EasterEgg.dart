import 'package:flutter/material.dart';

class EasterEggScreen extends StatelessWidget {
  List <String>_path = ['/Vale1.png', '/Vale2.png', '/Vale3.JPG'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
      child: ListView.builder(
        itemBuilder: (_, ind){
          
          return Container(child: Image.asset('assets/images'+_path[ind]));

        },
        itemCount: _path.length,
      ),
    )
      ],
      
       );
  }
}