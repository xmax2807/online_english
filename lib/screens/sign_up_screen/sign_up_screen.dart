import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/services/auth_service.dart';
import '../../gen/assets.gen.dart';
import '../../utils/field_validators/register_validator.dart';
import '../../utils/theme/my_theme.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/button_group.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  final ImageProvider<Object> backgroundImage =
      Assets.images.loginScreenBG.provider();

  final List<String> loginIconSvgs = [
    Assets.myCustomIcons.google,
    Assets.myCustomIcons.facebook,
    Assets.myCustomIcons.phone
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regValidator = ref.watch(registerValidator);
    final authService = ref.watch(authServiceProvider);
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(children: [
                              TextFormField(
                                validator: regValidator.validateEmail,
                                controller: regValidator.emailController,
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
                                      regValidator.emailController.text = '';
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ), //% space
                              TextFormField(
                                validator: regValidator.validatePassword,
                                controller: regValidator.passwordController,
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
                                height: 10,
                              ), //% space
                              TextFormField(
                                validator: regValidator.validateRePassword,
                                controller: regValidator.rePasswordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: "RePassword",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(25, 10, 25, 10),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    style: MyTheme.flatButtonStyle.copyWith(
                                      textStyle: const MaterialStatePropertyAll(
                                          TextStyle(fontSize: 18)),
                                    ),
                                    onPressed: !regValidator.isAllValid
                                        ? null
                                        : () {
                                            authService
                                                .signUp(regValidator.email,
                                                    regValidator.password)
                                                .then((value) {
                                              if (authService.isAuthenicated) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomeScreen()),
                                                );
                                              }
                                            });
                                          },
                                    child: const Text("Sign Up")),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Or sign in with',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyIconButtonGroup(
                                  svgs: loginIconSvgs,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                OutlinedButton(
                                  style: MyTheme.outlineButtonStyle,
                                  onPressed: () {},
                                  child: const Text("Back to Sign In"),
                                ),
                              ]),
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
