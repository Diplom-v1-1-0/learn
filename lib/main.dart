import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:learn/pages/about.dart';
import 'package:learn/pages/atoy.dart';
import 'package:learn/pages/birds.dart';
import 'package:learn/pages/animals.dart';
import 'package:learn/pages/flipcard.dart';
import 'package:learn/pages/games.dart';
import 'package:learn/pages/shapes.dart';
import 'package:learn/pages/solar.dart';
import 'package:learn/utils/routes.dart';
import 'package:learn/widgets/drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Эхлэл',
        theme: theme,
        darkTheme: darkTheme,
        home: const MyHomePage(),
        routes: {
          AllRoutes.homeRoute: (context) => const MyHomePage(),
          AllRoutes.atozRoute: (context) => const atoy(),
          AllRoutes.birdsRoute: (context) => BirdsPage(),
          AllRoutes.shapesRoute: (context) => const ShapesPage(),
          AllRoutes.solarRoute: (context) => const SolarPage(),
          AllRoutes.animalRoute: (context) => AnimalsPage(),
          AllRoutes.aboutRoute: (context) => const AboutPage(),
          AllRoutes.flipgameRout: (context) => const GamesPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isImageClicked1 = false;
  bool _isImageClicked2 = false;
  bool _isImageClicked4 = false;
  bool _isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Эхлэл',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isDarkTheme ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () {
              setState(() {
                _isDarkTheme = !_isDarkTheme;
              });
              final themeMode = Theme.of(context).brightness == Brightness.dark
                  ? AdaptiveThemeMode.light
                  : AdaptiveThemeMode.dark;
              AdaptiveTheme.of(context).setThemeMode(themeMode);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked1 = !_isImageClicked1;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.pushNamed(context, AllRoutes.atozRoute);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked1 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/alphabets.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Цагаан толгой',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("А-Я хүртэл үсэгнүүдийг сурцгаая"),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked2 = !_isImageClicked2;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.pushNamed(context, AllRoutes.animalRoute);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked2 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/animals.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Амьтан',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("Амьтад дуу чимээг таньж сурах"),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked4 = !_isImageClicked4;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.pushNamed(context, AllRoutes.birdsRoute);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked4 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/birds.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Шувуу',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Шувуунуудын нэрийг мэдэж ямар дуу чимээ гаргадыг мэдэх"),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked4 = !_isImageClicked4;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.pushNamed(context, AllRoutes.flipgameRout);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked4 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/solar.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Тоглоом танин мэдэхүй',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Хүүхдийн танин мэдэхүйн чадварыг тоглоом тоглуулж хөгжилтэй байдлаар нэмэгдүүлэх"),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
