import 'package:camera/providerrs/GridPlases.dart';
import 'package:camera/screens/add_plase_Scerrns.dart';
import 'package:camera/screens/plase_list_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GridPlases(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PlaseListScreens(),
        routes: {
          AddPlaceScreens.routeName: (ctx) => AddPlaceScreens(),
        },
      ),
    );
  }
}
