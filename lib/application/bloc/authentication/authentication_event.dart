part of 'authentication_bloc.dart';

class AuthenticationEvent extends Equatable {
  @override  
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}
class SignIn extends AuthenticationEvent {}
class SignOut extends AuthenticationEvent {}
