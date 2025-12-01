import 'package:flutter/material.dart';


class NavigationPage extends StatefulWidget{
  const NavigationPage({super.key});

  @override
  State<StatefulWidget> createState() => _NavigationPageState();

}

class _NavigationPageState extends State<NavigationPage>{
  int _selectedIndex = 0;

  void _onChangeNavigation(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Contoh navigasi")),
      body: Center(child: Text("Contoh navigasi", style: TextStyle(fontFamily: 'Oswald', fontSize:24, fontWeight: FontWeight.bold,),)),
      bottomNavigationBar: BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),

          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orange,
          onTap: _onChangeNavigation
      ),
    );
  }
}