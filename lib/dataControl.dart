import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DataControl {
  static const datakeyOrders = 'ordersData';
  static const datakeyClients = 'clientsData';
  static const datakeyVehicles = 'vehiclesData';
  static const datakeyUsers = 'usersData';

  static var orders = [];
  static var clients = [];
  static var vehicles = [];
  static var users = [];

  Future<void> dataInit() async {
    final prefs = await SharedPreferences.getInstance();

    String ordersData = prefs.getString(datakeyOrders) ?? '[]';
    String clientsData = prefs.getString(datakeyClients) ?? '[]';
    String vehiclesData = prefs.getString(datakeyVehicles) ?? '[]';
    String usersData = prefs.getString(datakeyUsers) ?? '[]';

    orders = json.decode(ordersData);
    clients = json.decode(clientsData);
    vehicles = json.decode(vehiclesData);
    users = json.decode(usersData);
  }

  Future<void> saveOrder(Map<String, String> order) async {
    orders.add(order);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(datakeyOrders, json.encode(orders));
  }

  Future<void> saveClient(Map<String, String> client) async {
    clients.add(client);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(datakeyClients, json.encode(clients));
  }

  Future<void> saveVehicle(Map<String, String> vehicle) async {
    vehicles.add(vehicle);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(datakeyVehicles, json.encode(vehicles));
  }

  Future<void> saveUser(Map<String, String> user) async {
    users.add(user);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(datakeyUsers, json.encode(users));
  }

  List getOrders() {
    return orders;
  }

  List getClients() {
    return clients;
  }

  List getVehicles() {
    return vehicles;
  }

  bool checkUser(String login, String password) {
    for (var user in users) {
      if (user['login'] == login && user['password'] == password) {
        return true;
      }
    }
    return false;
  }
}
