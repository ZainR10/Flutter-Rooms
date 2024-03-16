import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rooms/components/my_container.dart';
// import 'package:flutter_rooms/login.dart';
import 'package:flutter_rooms/utils/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
          'User Info',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //***name***
            Padding(
              padding: const EdgeInsets.all(20),
              child: MyContainer(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Name:',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                          style: const TextStyle(color: Colors.white),
                          name.toString())
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //***email ***
            Padding(
              padding: const EdgeInsets.all(20),
              child: MyContainer(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Email:',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                          style: const TextStyle(color: Colors.white),
                          email.toString())
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //***age ***
            Padding(
              padding: const EdgeInsets.all(20),
              child: MyContainer(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Age:',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                          style: const TextStyle(color: Colors.white),
                          age.toString())
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //***gender ***
            Padding(
              padding: const EdgeInsets.all(20),
              child: MyContainer(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gender:',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                          style: const TextStyle(color: Colors.white),
                          gender.toString())
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(60),
              child: InkWell(
                onTap: () async {
                  //this is how you initialize shared preferences.
                  //this is a future function that is why async and await key words are used.
                  SharedPreferences sp = await SharedPreferences.getInstance();

                  sp.setBool('isLogin', false);
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, RoutesName.Login);
                  // sp.remove('name');

                  // print(sp.getInt('age')); //to check stored value.
                  // print(sp.remove('name'));
                  // print(sp.getString('name'));
                  // print(sp.getBool('isLogin').toString());
                },
                child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text('Logout',
                            style: TextStyle(color: Colors.white)))),
              ),
            ),
          ]),
    );
  }
}
