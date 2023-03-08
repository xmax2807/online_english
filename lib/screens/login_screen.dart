import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';

class Androidlarge1Widget extends StatefulWidget {
  const Androidlarge1Widget({super.key});

  @override
  State<Androidlarge1Widget> createState() => _Androidlarge1WidgetState();
}

class _Androidlarge1WidgetState extends State<Androidlarge1Widget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Androidlarge1Widget - FRAME - VERTICAL

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image(
                image: Assets.images.loginScreenBG.provider(),
                fit: BoxFit.contain,
                color: const Color.fromRGBO(255, 255, 255, 0.25),
                colorBlendMode: BlendMode.modulate),
          ),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text('Welcome',
                          style: context.theme.textTheme.headlineLarge)),
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  const Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear_rounded),
                          onPressed: null,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ), //% space
                  const Flexible(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Flexible(
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: null,
                              child: const Text("Login")),
                        ),
                        const Flexible(
                          child:
                              TextButton(onPressed: null, child: Text("Login")),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
