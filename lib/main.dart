import 'package:auth_app/services/google_sigin_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('auth - app'),
          actions: [
            IconButton(onPressed: (){
              GoogleSignInService.signOut();
            }, icon: Icon(FontAwesomeIcons.doorOpen))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(onPressed: (){
                  GoogleSignInService.signInWithGoogle();
                },
                minWidth: double.infinity,
                height: 40,
                color: Colors.amber,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.google, color: Colors.white,),
                    Text('sign in with google', style: TextStyle(color: Colors.white, fontSize: 17),),
                  ],
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}