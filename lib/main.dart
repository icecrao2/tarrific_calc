import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tariff_calc/presentation/search_hs/search_hs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
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
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              iconTheme: IconThemeData(color: Colors.white),
            ),
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
        home: const SearchHsScreen()
    );
  }
}