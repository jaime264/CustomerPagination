import 'package:demo_customer/src/customer_model.dart';
import 'package:flutter/material.dart';

class CustomerDetail extends StatelessWidget {
  const CustomerDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Content arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: _detailCustomer(arguments),
    );
  }

  Widget _detailCustomer(Content argument) {
    return Column(
      children: [
        ListTile(
          title: Text('Name:'),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(argument.firstName),
        ),
        ListTile(
          title: Text('Lastname:'),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(argument.lastName),
        ),
        ListTile(
          title: Text('Email:'),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text(argument.email),
        ),
        ListTile(
          title: Text('Phone:'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(argument.phone),
        )
      ],
    );
  }
}
