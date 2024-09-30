import 'dart:convert';

import 'package:avaliacao_caio/pages/telaListagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Telalogin extends StatefulWidget{


  @override
  TelaloginState createState() => TelaloginState();
}


class TelaloginState extends State<Telalogin>{

  final TextEditingController username = TextEditingController();
  final TextEditingController pasword = TextEditingController();
  String token = "";

   Future<void> fetchData(TextEditingController username,TextEditingController  pasword) async {
    final response = await http.post(Uri.parse("http://demo5123040.mockable.io/login"),
      
      headers: {'Content-Type' : 'application/json'},
      body: jsonEncode({
        'email': username,
        'senha': pasword
      })
    );

    if(response.statusCode == 200) {
    
    final jsonResponse = json.decode(response.body);
    token = jsonResponse[0];
   
  
    } else {
      print("request failed with error: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox( 
              height: 50,
              width: 50,
              child:
            Text(
              "Usuário",
            )),
            SizedBox( 
              height: 80,
              width: 500,
              child:
             TextField(
                controller: username,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nome do usuário"
              ),
            ),),
            SizedBox( 
              height: 50,
              width: 50,
              child:
            Text(
              "Senha"
            )),
            SizedBox( 
              height: 80,
              width: 500,
              child:
            TextField(
              controller: pasword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite sua senha"
              ))
            ),
            ElevatedButton(onPressed: () => {
              
              fetchData(username, pasword),
              Navigator.push(context, MaterialPageRoute(builder: (context) => TelaListagem()))

            }, 
            child: Text("Entrar")
            ),

            Container(
              child: Center(
                child: Text("seu token é:  $token"),
              ),
            )
          ],
        ),
      ),

   );
  }
}