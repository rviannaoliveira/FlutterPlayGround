import 'package:flutter/material.dart';
import 'package:flutterapp/character/data/model/character.dart';
import 'package:flutterapp/character/data/character_repository.dart';

class ListPage extends StatelessWidget {
  final Future<Characters> characters = CharacterRepository().getAll();
  final List<Character> listMarota = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Center(
        child: FutureBuilder<Characters>(
          future: characters,
          builder: (context, builder) {
            if (builder.hasData) {
               final result = builder.data.results;

              return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, item) {
                    return ListTile(
                      trailing: Text("right"),
                      leading: Text("left"),
                      title: Text("${result[item].id}"),
                      subtitle: Text("${result[item].name}"),
                    );
                  });
            } else if(builder.hasError){
              return Text("DEU ERRO");
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
