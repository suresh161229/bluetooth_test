import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomDogProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _dogImage;
  String? get dogImage => _dogImage;

  Future<void> showRandomDog() async {
    try {
      _isLoading = true;
      notifyListeners();
      Uri url = Uri.parse("https://dog.ceo/api/breeds/image/random");
      final response = await http.get(url);
      // ignore: avoid_print
      print(response.body);
      if (response.statusCode == 200) {
        final decodeData = json.decode(response.body);
        _dogImage = decodeData["message"];
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
      }
    } on Exception catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool _isLoading1 = false;
  bool get isLoading1 => _isLoading1;

  var _data;
  get data => _data;

  Future<void> showPerson() async {
    try {
      _isLoading1 = true;
      notifyListeners();
      Uri url = Uri.parse("https://randomuser.me/api/");
      final response = await http.get(url);
      // ignore: avoid_print
      print(response.body);
      if (response.statusCode == 200) {
        final decodeData = json.decode(response.body);
        _data = decodeData["results"];
        _isLoading1 = false;
        notifyListeners();
      } else {
        _isLoading1 = false;
        notifyListeners();
      }
    } on Exception catch (e) {
      _isLoading1 = false;
      debugPrint(e.toString());
      notifyListeners();
    }
  }
}
