import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'models/my_element.dart';

class ElementRepository {
  List<MyElement> savedList = [];

  Future<List<MyElement>> fetchElements() async {
    List<MyElement> elementsList = [];
    // final db = Localstore.instance;

    if (savedList.isEmpty) {
      var response =
      await http.get(Uri.parse('https://putsreq.com/Ceu4N3voB0Fe41q0Y0Au'));
      final data = jsonDecode(response.body);
      data.forEach((element) {
        // final id = db.collection('elements').doc().id;
        // db.collection('elements').doc(element["title"]).set({'title': element["title"], 'body': element["body"]});
        elementsList.add(
            MyElement(element["title"], element["body"], const Icon(Icons.add)));
      });
      savedList = [...elementsList];
    }

    return elementsList;
  }
}