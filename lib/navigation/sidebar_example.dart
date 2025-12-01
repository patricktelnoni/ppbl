import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarExample extends StatefulWidget{
  const SideBarExample({super.key});

  @override
  State<StatefulWidget> createState() => _SideBarExampleState();
}

class _SideBarExampleState extends State{

  int _selectedIndex = 0;

  void _onChangeNavigation(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Contoh sidebar")),
      body: Row(
        children:[
          SidebarX(
            theme:SidebarXTheme(
              selectedItemDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              )
            ),
            controller: SidebarXController(selectedIndex: _selectedIndex, extended:true),
            items: [
              SidebarXItem(icon: Icons.home, label: 'Home', onTap: () =>_onChangeNavigation(0)),
              SidebarXItem(icon: Icons.search, label: 'Search', onTap: () =>_onChangeNavigation(1)),

            ]
          ),
        ]
      ),
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