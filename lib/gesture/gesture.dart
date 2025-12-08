import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureExample extends StatefulWidget {
  GestureExample({super.key});

  final double factor =0.0;
  final GestureTapCallback onTap = () =>{};


  @override
  State<GestureExample> createState() => _GestureExampleState();
}

class _GestureExampleState extends State<GestureExample> {
  Offset? _tapDownPosition;

  @override
  Widget build(BuildContext context) {
    final touchSlope = widget.factor *
        (MediaQuery.gestureSettingsOf(context).touchSlop ?? kTouchSlop);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onPanDown: (it) => print("onPanDown (${it.globalPosition})"),

      onPanEnd: (it) => print("onPanEnd (${it.velocity})"),
      onPanCancel: () => print("onPanCancel"),
      onPanUpdate: (it) => print("onPanUpdate (${it.delta})"),

      onTapDown: (details) {
        _tapDownPosition = details.globalPosition;
        print("Posisi tap $_tapDownPosition");
      },
      onTapUp: (details) {
        if (_tapDownPosition != null &&
            (details.globalPosition - _tapDownPosition!).distance <
                touchSlope) {
          widget.onTap();
          print("Lepas");
        }
      },

      /*onLongPress: () => (){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Hapus posting'),
            content: const Text('Apakah Anda akan menghapus posting ini?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Batal'),
                child: const Text('Batal'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'Oke'),
                child: const Text('Oke'),
              ),
            ],
          ),
        );
      },*/
      onTapCancel: () => _tapDownPosition = null,
      child: ElevatedButton(
          onPressed: (){}, 
          child: Text("Button")
      ),
    );
  }
}
