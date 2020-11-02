import 'package:camera/widgets/image_input.dart';
import 'package:flutter/material.dart';

class AddPlaceScreens extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlaceScreensState createState() => _AddPlaceScreensState();
}

class _AddPlaceScreensState extends State<AddPlaceScreens> {
  final _titleControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Plases")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _titleControler,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(),
                  ImageInput(),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Add Plase'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
