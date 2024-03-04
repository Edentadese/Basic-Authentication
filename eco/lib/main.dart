import 'package:eco/constants/global.dart';
import 'package:eco/content/admin/admin_screen.dart';
// import 'package:eco/content/authentication/screens/authentication_screen.dart';
import 'package:eco/content/authentication/services/authentication_service.dart';
import 'package:eco/content/home/screens/home_screen.dart';
import 'package:eco/content/splash/splash_screen.dart';
import 'package:eco/providers/user_provider.dart';
import 'package:eco/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => UserProvider()))
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthenticationService authenticationService = AuthenticationService();
  @override
  void initState() {
    super.initState();
    authenticationService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Ecommerce app',
        theme: ThemeData(
            colorScheme:
                const ColorScheme.light(primary: Global.secondaryColor),
            scaffoldBackgroundColor: Global.backgroundColor,
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty 
            ? Provider.of<UserProvider>(context).user.type=='user' 

              ? const HomeScreen()
              : const AdminScreen()
        : const SplashScreen()
        );
  }
}
