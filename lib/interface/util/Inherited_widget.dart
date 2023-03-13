import 'package:flutter/material.dart';
import 'package:vieddle/application/bloc/authentication/authentication_bloc.dart';

class InheritedBloc extends InheritedWidget {
  InheritedBloc({this.child, this.bloc}) : super(child: child);

  final AuthenticationBloc bloc;
  final Widget child;

  static InheritedBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedBloc>());
  }

  @override
  bool updateShouldNotify(InheritedBloc old) => bloc != old.bloc;
}

class OpenLoginScreen extends InheritedWidget {
  OpenLoginScreen({this.child, this.isLogin = false}) : super(child: child);

  final bool isLogin;
  final Widget child;

  static OpenLoginScreen of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<OpenLoginScreen>());
  }

  @override
  bool updateShouldNotify(OpenLoginScreen old) => isLogin != old.isLogin;
}

class LoginPosition extends InheritedWidget {
  LoginPosition({this.child, this.position = 0}) : super(child: child);

  final double position;
  final Widget child;

  static LoginPosition of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LoginPosition>());
  }

  @override
  bool updateShouldNotify(LoginPosition old) => position != old.position;
}

class MaterialWidget extends InheritedWidget {
  MaterialWidget({this.key, this.isDropDownOpen = false, this.child})
      : super(child: child);

  final GlobalKey<ScaffoldState> key;
  final bool isDropDownOpen;
  final Widget child;

  static MaterialWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<MaterialWidget>());
  }

  @override
  bool updateShouldNotify(MaterialWidget old) => true;
}
