import 'package:flutter/material.dart';
import 'package:vieddle/infrastructure/repository/user_repository/user.dart';

class TransportUserData extends InheritedWidget {
  TransportUserData({Key key, @required this.userRepository, this.child})
      : super(key: key, child: child);

  final Widget child;
  final UserRepository userRepository;

  static TransportUserData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TransportUserData>();
  }

  @override
  bool updateShouldNotify(TransportUserData oldWidget) =>
      oldWidget.userRepository != this.userRepository;
}
