import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/tariff_lookup/tariff_lookup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 16)),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              labelStyle: TextStyle(
                  color: Color.fromRGBO(76, 106, 255, 1),
                  fontWeight: FontWeight.w700),
            ),
            listTileTheme: const ListTileThemeData(
              tileColor: Colors.white,
            )),
        home: SafeArea(
            bottom: true,
            top: false,
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 53, 129, 1),
                        Color.fromRGBO(76, 106, 255, 1),
                      ],
                    ),
                  ),
                  // child: const SearchHsScreen()),
                  child: const TariffLookupScreen()),
            )));
  }
}
