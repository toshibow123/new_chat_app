import 'package:flutter/material.dart';
import 'file:///C:/Users/ignit/AndroidStudioProjects/new_chat_app/lib/src/my_home_page.dart';


import 'src/auth/stub.dart'
if (dart.library.io) 'package:new_chat_app/src/auth/android_auth_provider.dart'
if (dart.library.html)'src/auth/web_auth/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AuthProvider().initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'チャットアプリ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple
      ),
      home: MyHomePage(title: 'チャットアプリ',),
    );
  }
}
