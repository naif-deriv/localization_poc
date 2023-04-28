import 'package:cool_locale/locale_manager/locale_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String english = await rootBundle.loadString('assets/locale/en.arb');
  final String deutsch = await rootBundle.loadString('assets/locale/de.arb');
  final String spanish = await rootBundle.loadString('assets/locale/es.arb');

  await LocaleManager().init(langaugeCode: 'en', locales: [
    deutsch,
    english,
    spanish,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _visibility = 0;

  void _switchVisibility() {
    setState(() {
      _visibility = _visibility == 0 ? 1 : 0;
    });
  }

  void _incrementCounter() {
    if (_counter % 3 == 0) {
      LocaleManager().changeLocale('es');
    } else if (_counter % 3 == 1) {
      LocaleManager().changeLocale('de');
    } else {
      LocaleManager().changeLocale('en');
    }

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleManager().getString('applicationTitle')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _visibility.toDouble(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Don't forget the APPBAR!",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Icons.arrow_upward,
                    size: 80,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 100,
            // ),
            const Spacer(),
            const Text(
              'Normal String:',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              LocaleManager().getString('normalString'),
            ),
            const SizedBox(height: 50),
            const Text(
              'Variable String:',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              LocaleManager().getString(
                'stringWithVariables',
                args: [
                  'FOO',
                  'BAR',
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Date Now:',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              LocaleManager().getString(
                'dateNow',
                args: [
                  DateTime.now().toString(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'You have pushed the button this many times:',
            ),
            GestureDetector(
              onTap: _switchVisibility,
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
