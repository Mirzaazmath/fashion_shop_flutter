import 'package:fashion_shop_flutter/providers/addtocart_provider.dart';
import 'package:fashion_shop_flutter/providers/category_provider.dart';
import 'package:fashion_shop_flutter/providers/counter_provider.dart';
import 'package:fashion_shop_flutter/providers/size_provider.dart';
import 'package:fashion_shop_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
        ChangeNotifierProvider(create: (context)=>SizeProvider()),
        ChangeNotifierProvider(create: (context)=>CounterProvider()),
        ChangeNotifierProvider(create: (context)=>AddToCartProvider()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fashion App",
        theme: ThemeData(
          primaryColor:const Color(0xffd6f52e),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
