
import 'dart:io';

import 'package:BandApp/models/bands.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<Band> bands = [
  Band(id: '1',name: 'Heroes of Silence',votes: 2),
  Band(id: '2',name: 'Barracuda',votes: 5),
  Band(id: '3',name: 'Fast and furios',votes: 4),
  Band(id: '4',name: 'Gang gang',votes: 3),
];

@override
Widget build (BuildContext context){
  return Scaffold( 
    appBar: AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: Text('Band Names',style: TextStyle(color: Colors.black),),
    ),
    body: ListView.builder(
      itemCount: bands.length,
      itemBuilder: (context,i) => bandTile(bands[i]),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: addNewBand,
      elevation: 1,
      child: Icon(Icons.add),
    ),
  );
}

Widget bandTile(Band banda) {
  return Dismissible(
    onDismissed: (dismissd){
      //llamar al server para borrar
      print(' direcction $dismissd');
      print(' se borro ${banda.name}');
    },
    direction: DismissDirection.startToEnd,
    background: Container(
      padding: EdgeInsets.only(left:10.0),
      alignment: Alignment.centerLeft,
      child: Text('Delete',style: TextStyle(color: Colors.white, fontSize: 15.0),),
      color: Colors.red
    ),
    key: Key(banda.id),
    child: ListTile(
          title: Text(banda.name),
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(banda.name.substring(0,2)),
          ),
          trailing: Text('${banda.votes}',style: TextStyle(fontSize: 20),),
          onTap: (){
            print(banda.name);
          },
        ),
  );
}

addNewBand(){

final textController = new TextEditingController();

if (Platform.isAndroid){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text('Add New Band'),
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            textColor: Colors.blue,
            child: Text('Add'),
            onPressed: () => addBanToList(textController.text)
            )
        ],
      );
    }
    );



}
  showCupertinoDialog(
    context: context,
     builder: (_){
       return CupertinoAlertDialog(
         title: Text('Add a new Band'),
         content: CupertinoTextField(
           controller: textController,
         ),
         actions: [
           CupertinoDialogAction(
             isDefaultAction: true,
             child: Text('Add'),
             onPressed: () => addBanToList(textController.text),
             ),
             CupertinoDialogAction(
             isDestructiveAction: true,
             child: Text('Dismiss'),
             onPressed: () => Navigator.pop(context),
             ),
             
         ],
       );
     }
     );

  
}

addBanToList(String name){
  if (name.length > 1 && name.length < 18){
    //Podemos agregar
    this.bands.add(new Band(id: DateTime.now().toString(),name: name,votes: 0 ));
    setState(() {
    });
    Navigator.pop(context);
  }
}

}