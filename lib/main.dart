import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'architecture_example/bloc_pattern/course_bloc.dart';
import 'architecture_example/locator.dart';
import 'architecture_example/provider/auth_provider.dart';
import 'architecture_example/ui/course_list_view.dart';
import 'architecture_example/ui/login_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ProviderGeit',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Central(),
        ));
  }
}

class Central extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  Widget _buildUi() {
    return Container(
        child: Consumer<AuthProvider>(//                  <--- Consumer
            builder: (context, authProvider, child) {
      print("AuthProvider logged ${authProvider.loggedIn}");
      if (authProvider.loggedIn) {
        return CourseListView();
      } else {
        return LoginView();
      }
    }));
  }
}
