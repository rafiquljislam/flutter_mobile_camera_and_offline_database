import 'package:flutter/material.dart';
import 'package:mysql5/db_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;
  void insertData() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Rafiq',
      DatabaseHelper.columnAge: 20,
    };
    final id = await dbHelper.insert(row);
    print(id);
  }

  void quaryAll() async {
    var allrows = await dbHelper.quaryallrows();
    allrows.forEach((element) {
      print(element);
    });
  }

  void quaryFilter() async {
    var allrows = await dbHelper.qusryfilter(5);
    allrows.forEach((element) {
      print(element);
    });
  }

  void delate() async {
    var row = await dbHelper.deleteData(1);
    print(row);
  }

  void update() async {
    var row = await dbHelper.updateData(2);
    print(row);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton.icon(
                onPressed: insertData,
                label: Text("INSERT"),
                icon: Icon(Icons.add),
                color: Colors.green,
              ),
              RaisedButton.icon(
                onPressed: quaryAll,
                label: Text("QUERY"),
                icon: Icon(Icons.get_app_rounded),
                color: Colors.blue,
              ),
              RaisedButton.icon(
                onPressed: quaryFilter,
                label: Text("QUERY SPECIFIC"),
                icon: Icon(Icons.query_builder),
                color: Colors.red,
              ),
              RaisedButton.icon(
                onPressed: update,
                label: Text("UPDATE"),
                icon: Icon(Icons.query_builder),
                color: Colors.white54,
              ),
              RaisedButton.icon(
                onPressed: delate,
                label: Text("DELETE"),
                icon: Icon(Icons.delete),
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
