import 'package:flutter/material.dart';

class CustomToogle extends StatefulWidget {
  final List<bool> data;
  List<Widget> komponen = [];

  CustomToogle({super.key, required this.data, required this.komponen});

  @override
  State<CustomToogle> createState() => _CustomToogleState();
}

class _CustomToogleState extends State<CustomToogle> {
  late List<bool> _selections = widget.data;
  late List<Widget> _komponen = widget.komponen;

  @override
  Widget build(BuildContext context) {

    return ToggleButtons(
        isSelected: _selections,
        onPressed: (int index) {
          setState(() {
            _selections[index] = !_selections[index];
          });
        },
      children: _komponen,
    );
  }
}
