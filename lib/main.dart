import 'package:flutter/material.dart';
import 'package:flutter_training/router/routers.dart';

void main() {
  runApp(const MyApp());
}

final ValueNotifier<ThemeMode> notifierTheme = ValueNotifier(ThemeMode.light);
late ThemeMode currentTheme;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: notifierTheme,
      builder: (_, mode, __) {
        currentTheme = mode;
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode,
          initialRoute: AppRouter.main,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          navigatorObservers: [AppRouter().routeObserver],
          navigatorKey: AppRouter.navigatorKey,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Training Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            button("ExerciseC3", () {
              Navigator.pushNamed(context, AppRouter.exC3);
            }),
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
    );
  }

  Widget button(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
