import 'package:camera/model/Plase.dart';
import 'package:flutter/cupertino.dart';

class GridPlases with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get itemc {
    return [..._items];
  }
}
