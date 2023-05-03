import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:untitled4reduxfull/reducer.dart';
import 'package:untitled4reduxfull/state.dart';

import 'mainscreen.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState(Emailinfo: []),
  );




  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          body: MainScreen(),
        ),
      ),
    );
  }
}


