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
        automaticallyImplyLeading: false,
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
            Form(
              key: formData,
              child: Column(
                children: [
                  //******email*****
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),
                    controller: emailController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Email field cannot be empty";
                      }
                      if (!value.contains('@') || !value.contains('.com')) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                  ),

                  //age
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age',
                    ),
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your Age";
                      }
                      if (value.contains('@') || value.contains('.com')) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  //password
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                    controller: passwordController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Password field cannot be empty";
                      }
                      if (value.length <= 8) {
                        return "Password length must be greater than 8";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () async {
                // Store the context in a local variable
                BuildContext localContext = context;
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                sp.setBool('isLogin', true);
                // Use the localContext instead of context
                if (formData.currentState!.validate()) {
                  Navigator.push(localContext,
                      MaterialPageRoute(builder: (context) => const Student()));
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
