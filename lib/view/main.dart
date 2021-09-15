import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/tasknotifier.dart';
import 'package:todoapp/model/viewmode.dart';

import 'taskwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskNotifier()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home: const MyHomePage(title: 'To Do app'),
      ),
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: getWidget(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'All',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outline_blank_rounded),
              label: 'Todo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_rounded),
              label: 'Done',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.blueGrey,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
    );
  }

  getWidget() {
    switch(selectedIndex){
      case 0:
        return TaskWidget(ViewMode.all, "All Task");
      case 1:
        return TaskWidget(ViewMode.todo, "Incomplete Task");
      case 2:
        return TaskWidget(ViewMode.complete, "Completed Task");
    }
  }
}