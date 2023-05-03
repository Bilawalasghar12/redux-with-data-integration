


import 'package:untitled4reduxfull/state.dart';

import 'action.dart';
import 'model.dart';

AppState appReducer(AppState previousState, dynamic action) {
  AppState newState = AppState.fromState(previousState);
  if (action is AddAction) {
    if (action.type == 'fetching data') {
    print(action.data);
      for(int i = 0; i < action.data.length; i++) {
        newState.Emailinfo!.add(Email.fromMap(action.data[i]));
      }
    }
    print("length!!");
    print(newState.Emailinfo!.length);
  }
  return newState;
}
