
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(children: [

        TextFormField(
          decoration: InputDecoration(
            hintText: "Email",
          ),
        ),
        SizedBox(height: 5,),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Password",
          ),
        ),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: (){}, child: Text("Login"))
      ],),),
    );
  }
}
