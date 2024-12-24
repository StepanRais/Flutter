import 'package:flutter/material.dart';
import 'dataControl.dart';

class AddOrderScreen extends StatefulWidget {
  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _clientController = TextEditingController();
  final _statusController = TextEditingController();
  final DataControl dataControl = DataControl();

  void _addOrder() async {
    String client = _clientController.text;
    String status = _statusController.text;

    if (client.isEmpty || status.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }

    Map<String, String> newOrder = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'client': client,
      'status': status,
    };

    await dataControl.saveOrder(newOrder);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Order added successfully')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Order')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _clientController,
              decoration: InputDecoration(labelText: 'Client'),
            ),
            TextField(
              controller: _statusController,
              decoration: InputDecoration(labelText: 'Status'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addOrder,
              child: Text('Add Order'),
            ),
          ],
        ),
      ),
    );
  }
}
