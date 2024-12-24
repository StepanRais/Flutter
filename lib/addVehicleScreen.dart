import 'package:flutter/material.dart';
import 'dataControl.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _typeController = TextEditingController();
  final _modelController = TextEditingController();
  final _numberController = TextEditingController();
  final DataControl dataControl = DataControl();

  void _addVehicle() async {
    String type = _typeController.text;
    String model = _modelController.text;
    String number = _numberController.text;

    if (type.isEmpty || model.isEmpty || number.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }

    Map<String, String> newVehicle = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'type': type,
      'model': model,
      'number': number,
    };

    await dataControl.saveVehicle(newVehicle);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Vehicle added successfully')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Vehicle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _typeController,
              decoration: InputDecoration(labelText: 'Vehicle Type'),
            ),
            TextField(
              controller: _modelController,
              decoration: InputDecoration(labelText: 'Model'),
            ),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Vehicle Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addVehicle,
              child: Text('Add Vehicle'),
            ),
          ],
        ),
      ),
    );
  }
}
