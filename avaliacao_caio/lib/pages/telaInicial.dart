// ignore_for_file: prefer_const_constructors

import 'package:avaliacao_caio/pages/telaLogin.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'lib/assets/logoAvaliacaoFlut.png',
                height: 350,
                width: 350,
              )
            ),
            ElevatedButton(onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Telalogin()))
            }, child: Text('Entrar'))
          ],
        ),
      ),
    );
  }
}