import 'package:flutter/material.dart';

class Subtype extends StatefulWidget {
  final mainType;
  const Subtype({required this.mainType, super.key});

  @override
  State<Subtype> createState() => _SubtypeState();
}

class _SubtypeState extends State<Subtype> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.mainType.toString()),
    );
  }
}
