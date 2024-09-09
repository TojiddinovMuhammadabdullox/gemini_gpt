import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_gpt/onboarding.dart';
import 'package:gemini_gpt/themeNotifier.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: themeMode,
      home: const Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      textTheme: GoogleFonts.latoTextTheme(),
      colorScheme: const ColorScheme.light(),
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  // Dark Theme with Google Fonts
  ThemeData _buildDarkTheme() {
    return ThemeData(
      textTheme: GoogleFonts.latoTextTheme(),
      colorScheme: const ColorScheme.dark(),
      primaryColor: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.black,
    );
  }
}
