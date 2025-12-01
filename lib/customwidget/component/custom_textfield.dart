import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Widget prefixIcon;
  final String hintText;


  const CustomTextfield({super.key,
    required this.prefixIcon,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          maxHeight: height * 0.065,
          maxWidth: width,
        ),

        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        prefixIcon:prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.purpleAccent,
            width: 1.0,
          ),
        ),
        //contentPadding: const EdgeInsets.only(top: 12.0),
      ),
    );
  }
}
