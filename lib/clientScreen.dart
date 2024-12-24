import 'package:flutter/material.dart';
import 'dataControl.dart';

class ClientScreen extends StatefulWidget {
  final String? id;

  ClientScreen({this.id});

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final DataControl dataControl = DataControl();

  @override
  void initState() {
    super.initState();
    dataControl.dataInit();
  }

  void _addClient() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Client'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Client Name'),
                onChanged: (value) {},
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) {},
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) {},
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clients'),
      ),
      body: ListView.builder(
        itemCount: dataControl.getClients().length,
        itemBuilder: (context, index) {
          var client = dataControl.getClients()[index];
          return ListTile(
            title: Text(client['name']),
            subtitle: Text(client['phone']),
            onTap: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addClient,
        child: Icon(Icons.add),
      ),
    );
  }
}
