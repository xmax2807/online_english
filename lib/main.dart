import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/setting/settings.dart';
import 'package:online_english/screens/login_screen/login_screen.dart';
import 'package:online_english/utils/theme/my_theme.dart';

void main() {
  // runApp(DevicePreview(
  //   enabled: true,
  //   tools: const [
  //     ...DevicePreview.defaultTools,
  //     //const CustomPlugin(),
  //   ],
  //   builder: (context) => const ProviderScope(child: MyApp()),
  // ));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder<bool>(
        future: AppSetting.initialize(),
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: MyTheme.lightTheme,
            //(
            //   // This is the theme of your application.
            //   //
            //   // Try running your application with "flutter run". You'll see the
            //   // application has a blue toolbar. Then, without quitting the app, try
            //   // changing the primarySwatch below to Colors.green and then invoke
            //   // "hot reload" (press "r" in the console where you ran "flutter run",
            //   // or simply save your changes to "hot reload" in a Flutter IDE).
            //   // Notice that the counter didn't reset back to zero; the application
            //   // is not restarted.
            //   primarySwatch: Colors.blue,
            // ),
            home: snapshot.hasData
                ? LoginScreen(
                    key: GlobalKey(),
                  )
                : Scaffold(
                    key: GlobalKey(),
                    body: Center(child: Text('snapshot : ${snapshot.error}')),
                  ),
          );
        });
  }
}
