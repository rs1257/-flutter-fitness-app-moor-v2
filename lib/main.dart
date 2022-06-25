import 'package:fitness_app/data/moor_database.dart';
import 'package:fitness_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:preferences/preferences.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await PrefService.init(prefix: 'pref_');
    runApp(MyApp());
  }
  catch (e) {
    print(e);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return MultiProvider(
      providers: [
        Provider (
          create: (_) => AppDatabase().measurementDao,
        ),
        // put other daos here
      ],
      child: MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      )
    );
  }
}