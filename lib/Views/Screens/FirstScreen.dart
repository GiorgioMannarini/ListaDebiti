import 'package:flutter/material.dart';
import '../Components/ChartContainer.dart';
import '../Components/ActionsContainer.dart';
import '../../Controllers/FirstScreenController.dart';
import '../Components/ContainerButton.dart';



class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  final FirstScreenController firstScreenController = FirstScreenController();
  bool selected = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Lista Debiti',
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
                      ContainerButton("Expand", Icon(Icons.arrow_downward), Colors.purple, (){setState((){selected = !selected;});} ),
                      ContainerButton("Settings", Icon(Icons.exit_to_app), Colors.orange, (){print('Settings');}),
                      ContainerButton("Logout", Icon(Icons.exit_to_app), Colors.greenAccent, (){firstScreenController.logoutButton(context);}),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  
                  
              ),

            ],
          ),
          
          
        
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: (){},
                    elevation: 5,
                    backgroundColor: Theme.of(context).accentColor,
                    splashColor: Theme.of(context).primaryColor,
                    

                  ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


