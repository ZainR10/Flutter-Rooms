import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  const CustomButton({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.indigo,
                Colors.indigo.withOpacity(1), // Adjust opacity as needed
              ],
            ),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.indigo.withOpacity(0.5), // Adjust opacity as needed
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 9), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.indigo),
        height: 50,
        width: double.infinity,
        child: child);
  }
}
