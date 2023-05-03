import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled4reduxfull/model.dart';
import 'package:untitled4reduxfull/state.dart';

class AnotherScreen extends StatefulWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context , snap){
    return Column(
    children: [
    Text('REDUX Practice'),
      Text(snap.Emailinfo!.first.name.toString()),
      Text(snap.Emailinfo!.first.body.toString())

    ],
    );
    } );
  }
}
