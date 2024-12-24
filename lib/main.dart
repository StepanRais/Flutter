import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'registerScreen.dart';
import 'mainScreen.dart';
import 'orderScreen.dart';
import 'clientScreen.dart';
import 'vehicleScreen.dart';
import 'dataControl.dart';
import 'addOrderScreen.dart';
import 'addVehicleScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataControl dataControl = DataControl();
  await dataControl.dataInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/main': (context) => MainScreen(),
        '/order': (context) => OrderScreen(),
        '/addOrder': (context) => AddOrderScreen(),
        '/client': (context) => ClientScreen(),
        '/vehicle': (context) => VehicleScreen(),
        '/addVehicle': (context) => AddVehicleScreen()
      },
    );
  }
}
