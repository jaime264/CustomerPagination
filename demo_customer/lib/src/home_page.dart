import 'dart:convert';

import 'package:demo_customer/src/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Customers _customers;
  String _name = "";
  TextEditingController _filter = TextEditingController();

  //Paginación
  int _pageNumber = 1;
  int _totalItems = 0;

  @override
  void initState() {
    super.initState();
    _fetchGepCustomers();
  }

  void _fetchGepCustomers() async {
    var response = await http.get(
        "${Constans.baseUrl}listFilterPageable?page=$_pageNumber&size=10&sort=id&name=$_name");
    var decodedJson = jsonDecode(response.body);
    _customers == null
        ? _customers = Customers.fromJson(decodedJson)
        : _customers.content.addAll(Customers.fromJson(decodedJson).content);
    setState(() {
      _totalItems = _customers.content.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers proof'),
      ),
      body: _column(_customers),
    );
  }

  Widget _column(Customers customers) {

    var _valuePage = customers== null ? 0: customers.totalPages ;

    return Column(
      children: [
        TextField(
          controller: _filter,
          onChanged: (value){
                _name = _filter.text;
                _customers = null;
                _pageNumber = 1;
                _fetchGepCustomers();
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _name = _filter.text;
                _customers = null;
                _pageNumber= 1;
                _fetchGepCustomers();
              },
            ),
            border: OutlineInputBorder(),
            labelText: 'Filter',
          ),
        ),
        ListTile(
          title: Text('Paginas $_pageNumber/$_valuePage'),
        ),
        Expanded(child: _list(customers))
      ],
    );
  }

  Widget _list(Customers customers) {

    return ListView.builder(
      itemCount: _totalItems,
      itemBuilder: (BuildContext context, int index) {
        if (index >= customers.content.length - 1) {
          _pageNumber++;
          if (_pageNumber <= _customers.totalPages) {
            _fetchGepCustomers();
          }
        }

        return Padding(
          padding: EdgeInsets.only(left: 6.0, right: 2.0),
          child: _customer(customers.content[index]),
        );
      },
    );
  }

  Widget _customer(Content customer) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.person),
          title: Text(customer.firstName + " " + customer.lastName),
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: const Text('VER DATOS'),
              onPressed: () {
                Navigator.pushNamed(context, 'detail', arguments: customer);
              },
            ),
          ],
        ),
      ],
    ));
  }
}
