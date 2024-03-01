import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_rooms/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formData = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();

  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Let's get started",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            "Enter your detail's to continue",
            style: TextStyle(fontSize: 12),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Colors.amberAccent),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    key: formData,
                    child: Column(
                      children: [
                        //****name*****
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your Name',
                          ),
                          controller: nameController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Name field cannot be empty";
                            }

                            if (value.contains('@') || value.contains('.com')) {
                              return "Invalid Name";
                            }
                            // Check if the string contains an integer using a regular expression
                            if (RegExp(r'\d').hasMatch(value)) {
                              return 'Try removing integer';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        //******email*****
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your Email',
                          ),
                          controller: emailController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Email field cannot be empty";
                            }
                            if (!value.contains('@') ||
                                !value.contains('.com')) {
                              return "Invalid email address";
                            }
                            return null;
                          },
                        ),

                        //****age*****
                        const SizedBox(height: 30),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your Age',
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
                        const SizedBox(height: 30),
                        // Gender dropdown
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Please select your Gender',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select gender';
                            }
                            return null;
                          },
                          value: selectedGender,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },
                          items: <String>['Male', 'Female']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 30),
                        //password
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your Password',
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
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('name', nameController.text.toString());
                    sp.setString('email', emailController.text.toString());
                    sp.setString('gender', selectedGender.toString());
                    sp.setString('age', ageController.text.toString());
                    sp.setBool('isLogin', true);

                    if (formData.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Student()));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      height: 50,
                      width: double.infinity,
                      // color: Colors.black,
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
