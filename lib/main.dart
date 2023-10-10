import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/modules/updatescreen.dart';
import 'package:todo/provider/myprovider_layout.dart';
import 'package:todo/provider/provider_add_task.dart';
import 'package:todo/provider/provider_currentdate.dart';
import 'package:todo/provider/provider_settings.dart';
import 'package:todo/provider/providerisdone.dart';
import 'package:todo/shared/styles/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context)=>providerlayout()),
      ChangeNotifierProvider(
          create: (context)=>providersettings()),
      ChangeNotifierProvider(
          create: (context)=>provideraddtask()),
      ChangeNotifierProvider(
          create: (context)=>providercurrentdate()),
      ChangeNotifierProvider(
          create: (context)=>providerisdone()),
    ],
      child: MyApp()));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<providersettings>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale:Locale(pro.dropdownvalue) ,
      initialRoute: homelayout.routeName,
      routes: {
        homelayout.routeName :(context) =>homelayout(),
      },
      debugShowCheckedModeBanner: false,
      theme:my_theme.lightmode ,
      darkTheme: my_theme.darktmode,
      themeMode: pro.dropdownvalue2,



    );
  }
}

