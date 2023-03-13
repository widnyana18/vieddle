part of 'register_bloc.dart';

class RegisterEvent extends Equatable{  

  @override  
  List<Object> get props => [];  
}

class EmailRegisterChanged extends RegisterEvent{
  final String email;

  EmailRegisterChanged({this.email});

  @override  
  List<Object> get props => [email];  

  @override
  String toString() {
    return 'EmailRegisterChanged{email: $email}';    
  }
}

class PasswordRegisterChanged extends RegisterEvent{
  final String password;

  PasswordRegisterChanged({this.password});

  @override  
  List<Object> get props => [password];  

  @override
  String toString() {
    return 'PasswordRegisterChanged{password: $password}';    
  }
}

class ConfirmPasswordChanged extends RegisterEvent{
  final String confirmPassword, password;

  ConfirmPasswordChanged({this.confirmPassword, this.password});

  @override  
  List<Object> get props => [confirmPassword, password];  

  @override
  String toString() {
    return 'ConfirmPasswordChanged{confirmPassword: $confirmPassword, password: $password}';    
  }
}

class NameChanged extends RegisterEvent{
  final String name;

  NameChanged({this.name});

  @override  
  List<Object> get props => [name];  

  @override
  String toString() {
    return 'NameChanged{name: $name}';    
  }
}

class PhotoUrlChanged extends RegisterEvent{
  final String photoUrl;

  PhotoUrlChanged({this.photoUrl});

  @override  
  List<Object> get props => [photoUrl];  

  @override
  String toString() {
    return 'PhotoUrlChanged{photoUrl: $photoUrl}';    
  }
}

class PhoneNumberChanged extends RegisterEvent{
  final String phone;

  PhoneNumberChanged({this.phone});

  @override  
  List<Object> get props => [phone];  

  @override
  String toString() {
    return 'PhoneNumberChanged{phone: $phone}';    
  }
}

class Submitted extends RegisterEvent{
  final String email, confirmPassword;

  Submitted({this.email, this.confirmPassword});

  @override  
  List<Object> get props => [email, confirmPassword];  

  @override
  String toString() {
    return 'Submitted{email: $email, confirmPassword: $confirmPassword}';    
  }
}