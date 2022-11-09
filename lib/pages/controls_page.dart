import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifies/utils/routes.dart';
import 'package:wifies/utils/strings.dart';
import 'package:wifies/utils/requests.dart';

class Controls extends StatefulWidget {
  const Controls({Key? key}) : super(key: key);

  @override
  State<Controls> createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  final _formKey = GlobalKey<FormState>();
  //  String uuid='';
  //  String wifiId='';
  //  String deviceName='';
  //  String wifiPswd='';
  // List<String> responseDisplay = [];
  void displayData() async {
    if (_formKey.currentState!.validate()) {
      await RequestsToServer.add_device_request([]);
      await RequestsToServer.add_wifi_deets_request([]);
      Str.responseDisplay = await RequestsToServer.get_wifi_ect_for_app_request([]);
      print(Str.responseDisplay[1]);
      //await Future.delayed(Duration(seconds: 1));
      //developer.log(responseLogin);

      await Navigator.pushNamed(context, MyRoutes.displayRoute);
    }
  }

  // ignore: non_constant_identifier_names
  // void display_data() async {
  //   if(_formKey.currentState!.validate()) {
    
  //   //responseLogin= await RequestsToServer.login_request();
  //   print("hello");
  //   //await Future.delayed(Duration(seconds: 1));
  //   //developer.log(responseLogin);
  //   //await Navigator.pushNamed(context, MyRoutes.displayRoute);



    
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wifi-ES",
          style: TextStyle(color: Color(0xFF066A76)),
        ),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter UUID of device",
                                  labelText: "Device UUID"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "UUID can't be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                Str.uuid = value;
                                setState(() {});
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter Device name",
                                  labelText: "Device Name"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Device Name can't be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                Str.deviceName = value;
                                setState(() {});
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter SSID of wifi",
                                  labelText: "Wifi SSID"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Wifi SSID can't be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                Str.wifiId = value;
                                setState(() {});
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter password of wifi",
                                  labelText: "Wifi Password"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password can't be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                Str.wifiPswd = value;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    displayData();
                  },
                  child: Text(
                    'Scan',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan, //background color of button
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.all(40) //content padding inside button
                      ),
                ),

                SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),

                // ElevatedButton(

                //             onPressed: () {  },
                //             child: Text('Log', style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold, ),),
                //             style: ElevatedButton.styleFrom(
                //          primary: Colors.cyan, //background color of button
                //          elevation: 3, //elevation of button
                //          shape: RoundedRectangleBorder( //to set border radius to button
                //         borderRadius: BorderRadius.circular(10)
                //     ),
                //           padding: EdgeInsets.all(40) //content padding inside button
                //      ),
                //             ),

//                 ElevatedButton(
                          
//                           onPressed: () => displayData(),
                           
//                           child: Text('Scan', style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold, ),),
//                           style: ElevatedButton.styleFrom(
//                        primary: Colors.cyan, //background color of button
//                        elevation: 3, //elevation of button
//                        shape: RoundedRectangleBorder( //to set border radius to button
//                       borderRadius: BorderRadius.circular(10)
// ),
// ),
                
//             ),
            SizedBox(
                  height: 100.0,
                  width: 100.0,
                ),











                // SizedBox(
                //   child: Text(
                //     "ect: "+responseDisplay[0]+"\nkrack: "+responseDisplay[1]
                //     +"\npassword: "+responseDisplay[2]+"\nssid: "+responseDisplay[3]+"\nuser_id: "+responseDisplay[4]+"\nuuid: "+responseDisplay[5],
                //     style: TextStyle(color: Colors.cyan),
                //   ),
                //   height: 500.0,
                //   width: 500.0,
                // ),












              ],



                //],
                ),
                ),
                
                
                
              

              
          ),
        ),
      //),
    );
  }
}
