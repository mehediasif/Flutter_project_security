import 'package:flutter/material.dart';
import 'package:app_five/model/database/NotesHelper.dart';
import 'package:app_five/util/AppConfiguration.dart';
import 'package:app_five/util/AppRoutes.dart';
import 'package:app_five/util/LockManager.dart';
import 'package:app_five/util/MyRouteObserver.dart';
import 'package:app_five/util/ThemeData.dart';
import 'package:provider/provider.dart';

late MyNotes myNotes;
final RouteObserver<Route> routeObserver = RouteObserver<Route>();
MyRouteObserver myRouteObserver = MyRouteObserver();

class MyNotes extends StatelessWidget {
  const MyNotes(this.lockChecker);

  final LockChecker lockChecker;

  @override
  Widget build(BuildContext context) {
    myNotes = this;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NotesHelper>(
          create: (_) => NotesHelper(),
        ),
        ChangeNotifierProvider<AppConfiguration>(
          create: (_) => AppConfiguration(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          // debugPrint('Building again');
          Provider.of<AppConfiguration>(context);
          // ignore: prefer_typing_uninitialized_variables
          var _theme;
          final currentTheme =
              Provider.of<AppConfiguration>(context, listen: false).appTheme;
          if (currentTheme == AppTheme.Black) {
            // debugPrint('Dark theme');
            _theme = blackTheme(context);
          } else {
            _theme = lightTheme(context);
          }
          return MaterialApp(
            theme: _theme,
            title: 'Notes App',
            navigatorObservers: [myRouteObserver],
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}