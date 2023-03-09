import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_english/utils/theme/my_theme.dart';
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
      body: SafeArea(
        child: Stack(
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
                heightFactor: 0.8,
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text('Welcome',
                                  style: context.theme.textTheme.headlineLarge),
                              Text('Description',
                                  style: context.theme.textTheme.headlineMedium)
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
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
                    const SizedBox(
                      height: 10,
                    ), //% space
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            style: MyTheme.linkTextSyle,
                            text: 'Forgot Password?',
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    style: MyTheme.flatButtonStyle,
                                    onPressed: () {},
                                    child: const Text("Login")),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Or sign in with',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                              ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Not a member yet',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              OutlinedButton(
                                  style: MyTheme.outlineButtonStyle,
                                  onPressed: () {},
                                  child: const Text("Sign Up")),
                            ],
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
      ),
    );
  }
}
