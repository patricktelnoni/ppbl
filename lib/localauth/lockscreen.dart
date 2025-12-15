import 'package:flutter/material.dart';
import 'package:ppbl/localauth/auth.dart';
import 'package:ppbl/localauth/success.dart';
import 'package:ppbl/localauth/fail.dart';

class AuthLocal extends StatelessWidget {
  AuthLocal({super.key});

  final PerformAppAuthentication auth = PerformAppAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Auth"),),
      body: Text("Auth Data"),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final authenticated = await auth.authenticateWithBiometric();
          if(authenticated){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
          }
          else{
            SnackBar snackBar = SnackBar(content: Text("Gagal login"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

        },
        child: Icon(Icons.lock),
      )
    );
  }
}
