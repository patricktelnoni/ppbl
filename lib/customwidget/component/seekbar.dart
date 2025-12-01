import 'package:flutter/material.dart';

class Seekbar extends StatefulWidget {
  const Seekbar({super.key});

  @override
  State<Seekbar> createState() => _SeekbarState();
}

class _SeekbarState extends State<Seekbar> {
  double _currentVal = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(_currentVal.round().toString(), style: TextStyle(fontSize: 20),),
        Slider(
          activeColor: Colors.purple,
          inactiveColor: Colors.grey,
          min: 0,
          max: 100,
          value: _currentVal,
          label: _currentVal.round().toString(),
          onChanged: (value){
            setState(() {
              _currentVal = value;
            });

          }
        )
      ],
    );
    
  }
}
