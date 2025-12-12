import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier{

  /// Creating variables
  double _height = 0; //create height variable
  double _weight = 0; //create weight variable
  int _age = 0; //create age variable
  double _bmi = 0; //create bmi variable

  ///Create getter
  double get height => _height; // getter of height
  double get weight => _weight; // getter of weight
  int get age => _age; // getter of age
  double get bmi => _bmi; //getter of bmi

  String get category {
    if (_bmi == 0) return ''; // if bmi is equal to 0 show nothing
    if (_bmi < 18.5) return 'Underweight'; // if bmi is less than 18.5 show Underweight
    if (_bmi < 25) return 'Normal'; // if bmi is less than 25 show Normal
    if (_bmi < 30) return 'Overweight'; // if bmi is less than 30 show Overweight
    return "obese";
  }

  /// This function is display height
  void setHeight(String value) {
    _height = double.tryParse(value) ?? 0;
    notifyListeners();
  }

  /// This function is use to display weight
  void setWeight(String value) {
    _weight = double.tryParse(value) ?? 0;
    notifyListeners();
  }

  ///This function is use to display age
  void setAge(String value) {
    _age = int.tryParse(value) ?? 0;
    notifyListeners();
  }

  ///This is use to calculate bmi
  void calculateBmi() {
    if (_height <= 0 || _weight <= 0) { // if height is less than equal to 0 OR weight is less than equal to 0 then return bmi is qual to 0
      _bmi = 0;
    }  else {
      double heightMeters = _height * 0.3040; // convert it to height in meter from feet
      _bmi = _weight / (heightMeters * heightMeters); // height multiply by height divided weight
    }
    notifyListeners(); // It notify to change notifier that some has been update
  }

  /// It is use to reset all the values
  void reset() {
    _height = 0; // height is equal to 0
    _weight = 0; // weight is equal to 0
    _age = 0; // age is equal to 0
    _bmi = 0; // bmi is equal to 0
    notifyListeners();
  }
}