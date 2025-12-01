import 'package:flutter/material.dart';
import 'package:ppbl/customwidget/component/CustomButton.dart';
import 'package:ppbl/customwidget/component/CustomContainer.dart';
import 'package:ppbl/customwidget/component/custom_textfield.dart';
import 'package:ppbl/customwidget/component/seekbar.dart';
import 'package:ppbl/customwidget/component/toogle_button.dart';

enum ShirtSize { extraSmall, small, medium, large, extraLarge }

class CustomWidget extends StatelessWidget{


  List<(ShirtSize, String)> shirtSizeOptions = <(ShirtSize, String)>[
    (ShirtSize.extraSmall, 'XS'),
    (ShirtSize.small, 'S'),
    (ShirtSize.medium, 'M'),
    (ShirtSize.large, 'L'),
    (ShirtSize.extraLarge, 'XL'),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Widget"),
      
      ),
      body: CustomContainer(
          child: Column(
            children: [
              CustomTextfield(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Masukan email anda",
              ),
              CustomTextfield(
                  prefixIcon: Icon(Icons.password),
                  hintText: "Masukan password",
              ),

              CustomToogle(
                data: [false, false, false],
                komponen: const <Widget>[
                  Icon(Icons.format_bold),
                  Icon(Icons.format_italic),
                  Icon(Icons.format_underlined),
                ],
              ),

              CustomToogle(
                data: [false, false, false],
                komponen: const <Widget>[
                  Icon(Icons.sports_football),
                  Icon(Icons.sports_baseball),
                  Icon(Icons.sports_esports),
                ],
              ),
              CustomButton(
                text: 'Click Me!',
                color: Colors.purple,
                onPressed: () {
                  print('Button pressed!');
                },
              ),
              Seekbar()
              
            ],
          )
      ),
    );
  }

  
}