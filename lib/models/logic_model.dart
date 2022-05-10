import 'package:flutter/material.dart';

enum Gender { male, female, none }

class LogicModel with ChangeNotifier {
  int _scale = 40;
  int _age = 18;
  int _weight = 50;
  late Gender _gender = Gender.none;
  Color _color1 = Colors.black;
  Color _color2 = Colors.black;

  void scaleIncrement(value) {
    _scale = value.round();
    notifyListeners();
  }

  void ageIncrement() {
    _age++;
    notifyListeners();
  }

  void ageDecrement() {
    _age--;
    notifyListeners();
  }

  void weightIncrement() {
    _weight++;
    notifyListeners();
  }

  void weightDecrement() {
    _weight++;
    notifyListeners();
  }

  void setGenderMale() {
    _gender = Gender.male;
    notifyListeners();
  }

  void setGenderFemale() {
    _gender = Gender.female;
    notifyListeners();
  }

  void setGenderNone() {
    _gender = Gender.none;
    notifyListeners();
  }

  void setColor1() {
    _color1 = Color.fromARGB(255, 71, 70, 70);
    notifyListeners();
  }

  void setColor2() {
    _color2 = Color.fromARGB(255, 71, 70, 70);
    notifyListeners();
  }

  void reSetColor2() {
    _color2 = Colors.black;
    notifyListeners();
  }

  void reSetColor1() {
    _color1 = Colors.black;
    notifyListeners();
  }

  int get height => _scale;
  int get age => _age;
  int get weight => _weight;
  Gender get gender => _gender;
  Color get color1 => _color1;
  Color get color2 => _color2;
}
