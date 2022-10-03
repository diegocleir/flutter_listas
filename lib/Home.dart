import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){

    _itens = [];
    for(int i=0; i<=10; i++){

      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Lorem ipsum dolor sit amet.";
      item["descricao"] = "Descrição ${i} ipsum dolor sit amet.";
      _itens.add(item);

    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
            itemBuilder: (context, indice) {

              Map<String, dynamic> item = _itens[indice];
              //print("item ${ item.toString() }");

              return ListTile(
                onTap: (){
                  //print("clique com onTap ${indice}");
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(item["titulo"]),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.orange
                          ),
                          content: Text(item["descricao"]),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  print("selecionado sim");
                                  Navigator.pop(context);
                                },
                                child: Text("Sim")
                            ),
                            TextButton(
                                onPressed: (){
                                  print("selecionado nao");
                                  Navigator.pop(context);
                                },
                                child: Text("Não")
                            )
                          ],
                          //backgroundColor: Colors.orange,
                        );
                      });
                },
                /*onLongPress: (){
                  print("clique com onLongPress");
                },*/
                title: Text(item["titulo"]),
                subtitle: Text(item["descricao"]),
              );
            },
        ),
      ),
    );
  }
}
