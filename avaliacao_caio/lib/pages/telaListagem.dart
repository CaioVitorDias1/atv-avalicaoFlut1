import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Aluno {
  final String nome;
  final int nota;
  final String matricula;

  Aluno({required this.nome, required this.nota, required this.matricula});
}

class TelaListagem extends StatefulWidget {

 @override
  WTelaListagem createState() => WTelaListagem();

}

class WTelaListagem extends State<TelaListagem> {

  List<String>  listaProdutos = ['abc', 'r'];
  List<dynamic> dataList = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("http://demo5123040.mockable.io/notasAlunos"));
      
      if(response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      setState(() {
        dataList = jsonResponse["notas"];
      });
    } else {
      print("request failed with error: ${response.statusCode}");
    }
  }

@override
  void initState() {
    super.initState();
    fetchData();

  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            // Color colors = (index % 2 == 0)? Colors.blue : Colors.yellow;
            final item = dataList[index];
            return Column( children: [
              Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                // color: colors,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                // title: Text("Name: ${item["name"]}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Matricula: ${item['matricula']} '),
                    Text('Nome do aluno: ${item['nome']}'),
                    Text('Nota: ${item['nota']}'),
                  ],),
              ),
            ),
              // ElevatedButton(onPressed: fetchData, child: Text('notas <60')),
              // ElevatedButton(onPressed: fetchData, child: Text('notas entre 60 e 100')),
              // ElevatedButton(onPressed: fetchData, child: Text('notas 100'))
            
            ]);
          }
      ),
   );
  }
  
  
}
