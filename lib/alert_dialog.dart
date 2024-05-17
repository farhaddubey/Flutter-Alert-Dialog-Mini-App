import 'package:flutter/material.dart';

class AlertDl extends StatelessWidget {
  const AlertDl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation Alert Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async{
              final ConfirmAction action = (await _asyncConfirmDialog(context)) as ConfirmAction;
            }, child: const Text("Show Alert",
            style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }

}

enum ConfirmAction { Cancel, Accept}
Future<Future<ConfirmAction?>> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete This Contact?'),
        content: const Text(
            'This will delete the contact from your device.'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          ElevatedButton(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}