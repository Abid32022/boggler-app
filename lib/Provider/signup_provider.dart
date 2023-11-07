
import 'package:flutter/cupertino.dart';

class SignUpProvider with ChangeNotifier{

  bool _isChecked = false;

  bool get isChecked => _isChecked;

  isCheck(){
    _isChecked =! isChecked;
    notifyListeners();
  }
}