import 'package:flutter/material.dart';


class Aluno {
  final String nome;
  final int nota;

  Aluno({required this.nome, required this.nota});
}

class TelaListagem extends StatefulWidget {

 @override
  WTelaListagem createState() => WTelaListagem();

}

class WTelaListagem extends State<TelaListagem> {

  List<String>  listaProdutos = ['abc', 'r'];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final produtos = listaProdutos[index];
          return Card(
              margin: EdgeInsets.all(16),
              child: ListTile(
                title: Text("1"),

              ),
          );
        }
        ),
   );
  }
  
  
}