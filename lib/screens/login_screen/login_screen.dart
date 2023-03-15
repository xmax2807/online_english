import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../gen/assets.gen.dart';
import '../../utils/theme/my_theme.dart';
import '../home_screen/home_screen.dart';
import 'button_group.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ImageProvider<Object> backgroundImage =
      Assets.images.loginScreenBG.provider();

  final List<String> loginIconSvgs = [
    Assets.myCustomIcons.google,
    Assets.myCustomIcons.facebook,
    Assets.myCustomIcons.phone
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgroundImage, context);
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Androidlarge1Widget - FRAME - VERTICAL
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                  image: backgroundImage,
                  fit: BoxFit.contain,
                  color: const Color.fromRGBO(255, 255, 255, 0.25),
                  colorBlendMode: BlendMode.modulate),
            ),
            Center(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text('Welcome',
                                style: context.theme.textTheme.headlineLarge),
                            subtitle: Text('Description',
                                style: context.theme.textTheme.headlineMedium),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              const TextField(
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(25, 10, 25, 10),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
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
                                  contentPadding:
                                      EdgeInsets.fromLTRB(25, 10, 25, 10),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                      style: MyTheme.linkTextSyle,
                                      text: 'Forgot Password?',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {}),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                        style: MyTheme.flatButtonStyle.copyWith(
                                          textStyle:
                                              const MaterialStatePropertyAll(
                                                  TextStyle(fontSize: 18)),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeScreen()),
                                          );
                                        },
                                        child: const Text("Login")),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Or sign in with',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyIconButtonGroup(
                                      svgs: loginIconSvgs,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
