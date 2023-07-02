import 'package:flutter/material.dart';
import 'package:stayupdated/pages/homepage.dart';
import 'package:stayupdated/services/services_api.dart';
import 'package:theme_provider/theme_provider.dart';
import 'model/model_article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        themes: [AppTheme.dark(id: 'dark'), AppTheme.light(id: 'light')],
        defaultThemeId: 'dark',
        child: ThemeConsumer(
            child: Builder(
          builder: (themeContext) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.black,
              primaryColorDark: Colors.black,
            ),
            home: const HomeScreen(),
          ),
        )));
  }
}
