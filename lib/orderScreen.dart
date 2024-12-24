import 'package:flutter/material.dart';
import 'dataControl.dart';
import 'addOrderScreen.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final DataControl dataControl = DataControl();

  @override
  void initState() {
    super.initState();
    dataControl.dataInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: FutureBuilder(
        future: dataControl.dataInit(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List orders = dataControl.getOrders();

            if (orders.isEmpty) {
              return Center(child: Text('No orders available.'));
            }

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Order ${orders[index]["id"]}'),
                  subtitle: Text(
                      'Client: ${orders[index]["client"]}, Status: ${orders[index]["status"]}'),
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
          Navigator.pushNamed(context, '/addOrder');
        },
        child: Icon(Icons.add),
        tooltip: 'Add Order',
      ),
    );
  }
}
