
import 'package:flutter/material.dart';
import 'package:wifies/utils/routes.dart';
import 'package:wifies/utils/strings.dart';
import 'package:wifies/utils/requests.dart';
import 'dart:developer' as developer;

class LoginPage extends StatefulWidget {
  
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String name="";
  // String pswd="";
  bool changeButton=false;
  String responseLogin="";
  final _formKey=GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    
    if(_formKey.currentState!.validate()) {
    setState(() {
      changeButton=true;
    });
    //responseLogin= await RequestsToServer.login_request();
    print("hello");
    await Future.delayed(Duration(seconds: 1));
    //developer.log(responseLogin);
    await Navigator.pushNamed(context, MyRoutes.controlsRoute);
    setState(() {
      changeButton=false;
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.cyan[100],
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/locked.jpg", 
              fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Welcome ${responseLogin}", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                  decoration:InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ) ,
                  validator: (value){
                    if(value!.isEmpty){
                      return "SSID cannot be empty";
                    }
                    return null;
                  },
                  onChanged:(value){
                    Str.name=value;
                    setState(() {
                      
                    });
                  } ,
                ),
                TextFormField(
                  obscureText: true,
                  decoration:InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ) ,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                    else if(value.length<4){
                      return "Password length should be at least 4";
                    }
                    return null;
                  },
                  onChanged: (value){
                    print("hello");
                    Str.pswd=value;
                    setState(() {
                      
                    });
                  },
                ),
                  ],
                  ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                child: InkWell(
                  //splashColor: Colors.red,
                  onTap: () {

                    moveToHome(context);
                    },
                  child: AnimatedContainer(
                    
                    duration: Duration(seconds: 1),
                    height: 50,
                    width:changeButton?50:150,
                    //color: Colors.deepPurple,
                    alignment: Alignment.center,
                    child: changeButton?Icon(Icons.done, color: Colors.white,):Text("Login",
                    style: TextStyle(
                      color: Color(0xFF022727),
                      fontSize: 18,
                    ) ),
                    decoration: BoxDecoration(
                      color:  Color(0xFF046A6A),
                      //shape: changeButton?BoxShape.circle:BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(changeButton?20:8),
                    )
                    ,),
                ),
              )
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   }, 
              //   child: Text("Login"),
              //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
              //   ),
            ],
            ),
        ),
      ),
    );
  }
}