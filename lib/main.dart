import 'package:fashion_shop_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp( const MyApp());
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fashion App",
      theme: ThemeData(
        primaryColor:const Color(0xffd6f52e),
      ),
      home: HomeScreen(),
    );
  }
}
