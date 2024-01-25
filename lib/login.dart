import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              //this is how you initialize shared preferences.
              onTap: () async {
                //this is a future function that is why async and await key words are used.
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('name',
                    'zain'); //to set/store name or any other value in string.
                sp.setInt('age',
                    18); //to set/store age or any other value in integer.
                print(sp.getInt('age')); //to check stored value.
                print(sp.getString('name'));
              },
              child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.pink,
                  child: const Center(child: Text('Login'))),
            )
          ],
        ),
      ),
    );
  }
}
