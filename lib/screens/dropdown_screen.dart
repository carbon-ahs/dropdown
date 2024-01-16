// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dropdown/screens/sub_type_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  List<Map<String, String>> buildingTypeList = [
    {"title": "RESIDENTIAL", "value": "A"},
    {"title": "EDUCATIONAL", "value": "B"},
    {"title": "INSTITUTION FOR CARE", "value": "C"},
    {"title": "HEALTH CARE FACILITIES", "value": "D"},
    {"title": "BUSINESS", "value": "E"},
    {"title": "MERCANTILE", "value": "F"},
    {"title": "INDUSTRIAL", "value": "G"},
    {"title": "STORAGE", "value": "H"},
    {"title": "ASSEMBLY", "value": "I"},
    {"title": "HAZARDOUS", "value": "J"},
    {"title": "GARAGES", "value": "K"},
    {"title": "Other", "value": "O"}
  ];

  String userSelectValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fire Safty"),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                contentPadding: const EdgeInsets.all(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: userSelectValue,
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    DropdownMenuItem(
                        value: "",
                        child: Text(
                          "Select a type",
                        )),
                    ...buildingTypeList.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          value: data['value'],
                          child: Text(
                            data['title']!.toString(),
                            style: TextStyle(),
                          ));
                    }).toList(),
                  ],
                  onChanged: (value) {
                    print("Selected Value : $value");
                    setState(() {
                      userSelectValue = value!;
                    });
                  },
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (userSelectValue == "") {
                    print("Select pls");
                  } else {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (_) => Subtype(mainType: userSelectValue)));
                  }
                },
                child: Text("Submit"))
          ],
        ));
  }
}
