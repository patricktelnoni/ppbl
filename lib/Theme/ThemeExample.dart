import 'package:flutter/material.dart';

class ThemeExample extends StatefulWidget{
  const ThemeExample({super.key});

  @override
  State<ThemeExample> createState() => _ThemeExampleState();

}

class _ThemeExampleState extends State<ThemeExample> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Coba Theme"),),
      body: Column(
        children: [
          Text(
            "Contoh theme google font",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(onPressed: (){},
              child: Text("Kirim"),
            style: Theme.of(context).elevatedButtonTheme.style,

          )
        ],
      ),
    );
  }
}
