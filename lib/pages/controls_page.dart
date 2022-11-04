import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Controls extends StatefulWidget {
  const Controls({ Key? key }) : super(key: key);

  @override
  State<Controls> createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wifi-ES", style: TextStyle(color: Color(0xFF066A76)),),
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.comment),
          //   tooltip: 'Comment Icon',
          //   onPressed: () {},
          // ), //IconButton
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Setting Icon',
            color: Color(0xFF066A76),
            onPressed: () {},
          ), //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.cyan,
        elevation: 50.0,
        leading: IconButton(
          color: Color(0xFF066A76),
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(
                          
                          onPressed: () {  },
                          child: Text('Scan', style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold, ),),
                          style: ElevatedButton.styleFrom(
                       primary: Colors.cyan, //background color of button
                       elevation: 3, //elevation of button
                       shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(10)
                  ),
                        padding: EdgeInsets.all(40) //content padding inside button
                   ),
                          ),
          
              SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              
              ElevatedButton(
                          
                          onPressed: () {  },
                          child: Text('Log', style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold, ),),
                          style: ElevatedButton.styleFrom(
                       primary: Colors.cyan, //background color of button
                       elevation: 3, //elevation of button
                       shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(10)
                  ),
                        padding: EdgeInsets.all(40) //content padding inside button
                   ),
                          ),
                
              
            ],
            ),

            SizedBox(
              
              height: 100.0,
              width: 100.0,
              
            ),


            SizedBox(
              child: Text("here we would display the details", style: TextStyle(color: Colors.cyan),
              ),
              height: 500.0,
              width: 500.0,
              
            ),
          ],
          ), 
        ),
      ),
    );
  }
}