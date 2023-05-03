import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';


import 'package:http/http.dart' as http;
import 'package:untitled4reduxfull/anotherscreen.dart';
import 'package:untitled4reduxfull/state.dart';

import 'action.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter:  (store) => store.state,
      builder: (context, snap) {
        return snap.Emailinfo!.length > 0 ?  SingleChildScrollView(
          child: ListView.builder(
            itemCount: snap.Emailinfo!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                 // Text('Practicing Redux with integration'),\

                    SizedBox(height: 20,),
                    Text(snap.Emailinfo?.first.id.toString() ?? "data not found"),
                    Text(snap.Emailinfo?.first.body.toString() ?? "data not found"),

                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: () async{
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AnotherScreen()),
                        );
              },
                      child:Text('Show chart name')),





                ],

              );
            }
          ),

        ) : Container();

      } );
  }

    Future getData()async{


  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var data = jsonDecode(response.body.toString());
  print(response.statusCode);
  print(data);
  if (response.statusCode== 200){
    StoreProvider.of<AppState>(context).dispatch(
      AddAction(
        type: 'fetching data',
        data: data,
      ),
    );
    print(response);
setState(() {

});
  }

  }

}
