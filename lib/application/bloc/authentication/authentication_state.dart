part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  @override  
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  // Authenticated({this.uid, this.name, this.photo});

  // final String uid;
  // final String name;
  // final String photo;

  // @override  
  // List<Object> get props => [uid, name, photo];  
}

class Unauthenticated extends AuthenticationState {}
