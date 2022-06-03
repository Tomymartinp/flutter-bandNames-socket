

import 'dart:io';

import 'package:bandnames_app/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {


   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List<Band> bands = [
 Band(id: '1',name: 'Metallica',votes: '5'), 
 Band(id: '2',name: 'RammStein',votes: '8'),
 Band(id: '3',name: 'ACDC',votes: '4'),
 Band(id: '4',name: 'Diamond Head',votes: '3'),

];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Band Names', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        child: Icon(Icons.add),
        onPressed: addNewBand,
      ),
    );
  }

  Widget _bandTile( Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.only( left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Band Deleted', style: TextStyle( color: Colors.white)),

        ),
      ),
      child: ListTile(
            leading: CircleAvatar(
              child: Text( band.name.substring(0,2)),
              backgroundColor: Colors.blue[100],
            ),
            title: Text(band.name),
            trailing: Text(band.votes, style: TextStyle( fontSize: 20)),
            onTap:(){} ,
          ),
    );
  }

addNewBand(){

  final textController = TextEditingController();

  if ( Platform.isAndroid ) {
  return showDialog(
 context: context, builder: (BuildContext context) { 
   return AlertDialog(
     title: Text('New Band Name'),
     content: TextField(
       controller: textController,
     ),
     actions: [
       MaterialButton(
         child: Text('Add'),
         elevation: 5,
         textColor: Colors.blue,
         onPressed: () => addBandToList(textController.text)  
      )
     ],
   );
  }, 
 );
 }


showCupertinoDialog(
  context: context,
  builder: (BuildContext context) { 
    return CupertinoAlertDialog(
      title: Text('New Band Name'),
      content: CupertinoTextField(
        controller: textController,
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Add'),
          onPressed: () => addBandToList(textController.text),
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

void addBandToList ( String name ){
if ( name.length > 1 ){
  bands.add( Band(
  id: DateTime.now().toString(),
  name: name,
  votes: '0' )
  );
  setState(() {});

}

Navigator.pop(context);

}


}