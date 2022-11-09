import 'package:flutter/material.dart';
import 'package:wifies/utils/strings.dart';



class Display extends StatelessWidget {
  const Display({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Center(child: SizedBox(
                    child: Center(child:Text(
                    "ect: "+Str.responseDisplay[0]+"\nkrack: "+Str.responseDisplay[1]
                    +"\npassword: "+Str.responseDisplay[2]+"\nssid: "+Str.responseDisplay[3]+
                    "\nuser_id: "+Str.responseDisplay[4]+"\nuuid: "+Str.responseDisplay[5],
                    style: TextStyle(color: Colors.cyan),
                  ),),
                    height: 500.0,
                    width: 500.0,
                  ),),
      ),
    );
  }
}

