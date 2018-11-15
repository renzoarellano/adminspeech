import 'package:flutter/material.dart';
import 'dart:convert';

class SecondFragment extends StatelessWidget {

    var datos = '''[
      {
      "icon":"looks_one",
      "nombre":"Puerta",
      "estado" : "Apagado"
      },
      {
        "icon":"highlight",
        "nombre":"Foco 1",
        "estado" : "Apagado"
      },
      {
        "icon":"highlight",
        "nombre":"Foco 2",
        "estado" : "Apagado"
      },
      {
        "icon":"highlight",
        "nombre":"Foco 3",
        "estado" : "Apagado"
      },
      {
        "icon":"highlight",
        "nombre":"Foco 4",
        "estado" : "Apagado"
      },
      {
        "icon":"highlight",
        "nombre":"Foco 5",
        "estado" : "Apagado"
      },
      {
        "icon":"highlight",
        "nombre":"Foco 6",
        "estado" : "Apagado"
      }
      ]''';


  @override
  Widget build(BuildContext context) {
    int _act = 1;
    final title = 'Basic List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('Puerta'),
            ),
            ListTile(
              leading: Icon(Icons.highlight),
              title: Text('Foco'),
            ),
            ListTile(
              leading: Icon(Icons.highlight),
              title: Text('Foco'),
              subtitle: _act != 2 ? const Text('Apagado') : null,
            ),
          ],
        ),
      ),
    );
  }

}