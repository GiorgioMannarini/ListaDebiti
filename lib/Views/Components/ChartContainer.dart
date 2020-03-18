import 'package:flutter/material.dart';

class ChartContainer extends StatefulWidget {
  bool selected;


  ChartContainer(bool selected){
    this.selected = selected;

  }
  @override
  _ChartContainerState createState() => _ChartContainerState();
}

class _ChartContainerState extends State<ChartContainer> {



  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21),
      width: MediaQuery.of(context).size.width,
      height: widget.selected ? 350 : 30,
      duration: Duration(seconds: 1),
      curve: Curves.ease,
      child: FlutterLogo(size: 75),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey[300],
            spreadRadius: 5.0,
          ),
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(41),
            bottomRight: Radius.circular(41)
        ),
        color: Colors.white,
      ),
    );
  }
}
