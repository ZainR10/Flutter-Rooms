import 'package:flutter/material.dart';
import 'package:flutter_rooms/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  String name = '', email = '', age = '', gender = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      name = sp.getString('name') ?? '';
      email = sp.getString('email') ?? '';
      age = sp.getString('age') ?? '';
      gender = sp.getString('gender') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Student Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        //***name***
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Name:'), Text(name.toString())],
          ),
        ),
        const SizedBox(height: 10),
        //***email ***
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Email:'), Text(email.toString())],
          ),
        ),
        const SizedBox(height: 10),
        //***age ***
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Age:'), Text(age.toString())],
          ),
        ),
        const SizedBox(height: 10),
        //***gender ***
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Gender:'), Text(gender.toString())],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(100),
          child: InkWell(
            onTap: () async {
              //this is how you initialize shared preferences.
              //this is a future function that is why async and await key words are used.
              SharedPreferences sp = await SharedPreferences.getInstance();

              sp.setBool('isLogin', false);
              // ignore: use_build_context_synchronously
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
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
                    child:
                        Text('Logout', style: TextStyle(color: Colors.white)))),
          ),
        ),
      ]),
    );
  }
}
