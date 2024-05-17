import 'package:flutter/material.dart';
import 'package:flutter_alert_dialog/alert_dialog.dart';

void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Alert Dialogs',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: TextFieldAlertDialog(),
    );
  }
}
class TextFieldAlertDialog extends StatelessWidget{
  TextEditingController _textEditingController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('TextField Alert Demo'),
        content: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(hintText: "Text Field in Dialog"),
        ),
        actions: <Widget>[
          new ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: new Text('Submit'))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('TextField Alert Dialog')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              child: Text(
                'Show Alert' ,style: TextStyle(fontSize: 20),
              ),
              onPressed: (){
                _displayDialog(context);
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AlertDl()));
            }, child: Text('Confirm Dialog')),
          ],
        )

      ),
    );
  }

}