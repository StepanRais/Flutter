import 'package:flutter/material.dart';
import 'orderScreen.dart';
import 'clientScreen.dart';
import 'vehicleScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/order'),
              child: Text('View Orders'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/client'),
              child: Text('View Clients'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/vehicle'),
              child: Text('View Vehicles'),
            ),
          ],
        ),
      ),
    );
  }
}
