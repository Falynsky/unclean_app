import 'package:flutter/material.dart';
import 'package:unclean_app/pages/screen_resolver/screen_resolver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'unclean_app',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: ScreenResolver(),
        ),
      ),
    );
  }
}
