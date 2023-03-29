import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/widgets/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 255, .5),
                  Color.fromRGBO(255, 188, 117, .9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                  transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0), /*cascade operator*/ 
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange.shade900),
                  child: const Text(
                    'Minha Loja',
                    style: TextStyle(
                        fontSize: 45, fontFamily: 'Anton', color: Colors.white),
                  ),
                ),
                AuthForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
