import 'model.dart';

class AppState {
  List<Email>? Emailinfo;


  AppState({
    this.Emailinfo,
});


  AppState.fromState(AppState anotherState) {
    Emailinfo = anotherState.Emailinfo;
  }


}