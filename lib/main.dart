import 'package:crypto_exchange_flutter/provider/cryptoDataProvider.dart';
import 'package:crypto_exchange_flutter/provider/themeProvider.dart';
import 'package:crypto_exchange_flutter/ui/mainWrapper.dart';
import 'package:crypto_exchange_flutter/ui/signUpScreen.dart';
import 'package:crypto_exchange_flutter/ui/ui_helper/themeSwitchers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => themeprovider()),
      ChangeNotifierProvider(create: (context) => cryptoDataProvider()),

    ],

    child: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<themeprovider>(
        builder: (context,themeprovider,child){
          return MaterialApp(
            locale: const Locale('en', ''),
            localizationsDelegates:const [
              // AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
              Locale('es', ''), // Spanish, no country code
            ],
            debugShowCheckedModeBanner: false,
            themeMode: themeprovider.themeMode,
            theme: MyTheme.LightTheme,
            darkTheme: MyTheme.DarkTheme,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(

                body: mainWrapper(),

              ),
            ),
          );
        }
    );
  }
}


