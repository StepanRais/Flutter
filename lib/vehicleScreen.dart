import 'package:flutter/material.dart';
import 'dataControl.dart';
import 'addVehicleScreen.dart';

class VehicleScreen extends StatefulWidget {
  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final DataControl dataControl = DataControl();

  @override
  void initState() {
    super.initState();
    dataControl.dataInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vehicles')),
      body: FutureBuilder(
        future: dataControl.dataInit(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List vehicles = dataControl.getVehicles();

            if (vehicles.isEmpty) {
              return Center(child: Text('No vehicles available.'));
            }

            return ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Vehicle ${vehicles[index]["id"]}'),
                  subtitle: Text(
                      'Type: ${vehicles[index]["type"]}, Model: ${vehicles[index]["model"]}'),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addVehicle');
        },
        child: Icon(Icons.add),
        tooltip: 'Add Vehicle',
      ),
    );
  }
}
