import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/screens/sign_up_screen/sign_up_screen.dart';
import 'package:online_english/services/auth_service.dart';
import 'package:online_english/utils/field_validators/login_validator.dart';
import 'package:online_english/utils/pop_up/pop_up_ui.dart';
import '../../gen/assets.gen.dart';
import '../../utils/theme/my_theme.dart';
import '../home_screen/home_screen.dart';
import 'button_group.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final ImageProvider<Object> backgroundImage =
      Assets.images.loginScreenBG.provider();

  final List<String> loginIconSvgs = [
    Assets.myCustomIcons.google,
    Assets.myCustomIcons.facebook,
    Assets.myCustomIcons.phone
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginValidator = ref.watch(loginValidatorProvider);
    final authService = ref.watch(authServiceProvider);
    // Figma Flutter Generator Androidlarge1Widget - FRAME - VERTICAL
    return Scaffold(
      key: scaffoldMessengerKey,
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
                          Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(children: [
                              TextFormField(
                                validator: loginValidator.validateEmail,
                                controller: loginValidator.emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 10, 25, 10),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.clear_rounded),
                                    onPressed: () {
                                      loginValidator.emailController.text = '';
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ), //% space
                              TextFormField(
                                validator: loginValidator.validatePassword,
                                controller: loginValidator.passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
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
                            ]),
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
                                        onPressed: !loginValidator.isAllValid
                                            ? null
                                            : () {
                                                authService
                                                    .signInWithEmailAndPassword(
                                                        loginValidator.email,
                                                        loginValidator.password)
                                                    .then((value) {
                                                  if (authService
                                                      .isAuthenicated) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const HomeScreen()),
                                                    );
                                                  }
                                                });
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
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()),
                                        );
                                      },
                                      child: const Text("Sign Up")),
                                ],
                              )
                            ],
                          ),
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
