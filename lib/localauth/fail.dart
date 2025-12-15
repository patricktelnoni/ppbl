import 'package:flutter/material.dart';

class Fail extends StatelessWidget {
  const Fail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fail"),),
      body: Text("Gagal"),
    );
  }
}
