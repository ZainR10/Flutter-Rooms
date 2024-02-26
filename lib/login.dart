import 'package:flutter/material.dart';
import 'package:flutter_rooms/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formData = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              //email
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
              controller: emailController,
            ),
            const SizedBox(height: 10),
            TextFormField(
              //age
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
              ),
              keyboardType: TextInputType.number,
              controller: ageController,
            ),
            const SizedBox(height: 10),
            TextFormField(
              //password
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                //this is how you initialize shared preferences.
                //this is a future function that is why async and await key words are used.
                SharedPreferences sp = await SharedPreferences.getInstance();
                //to set/store name or any other value in string.
                sp.setString('email', emailController.text.toString());
                //to set/store age or any other value in integer.
                sp.setString('age', ageController.text.toString());
                sp.setBool('isLogin', true);
                // ignore: use_build_context_synchronously
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Student()));
                // sp.remove('name');

                // print(sp.getInt('age')); //to check stored value.
                // print(sp.remove('name'));
                // print(sp.getString('name'));
                // print(sp.getBool('isLogin').toString());
              },
              child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
