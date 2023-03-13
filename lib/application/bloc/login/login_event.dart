part of 'login_bloc.dart';

class LoginEvent extends Equatable{  

  @override  
  List<Object> get props => [];  
}

class EmailChanged extends LoginEvent{
  final String email;

  EmailChanged({this.email});

  @override  
  List<Object> get props => [email];  

  @override
  String toString() {
    return 'EmailChanged{email: $email}';    
  }
}

class PasswordChanged extends LoginEvent{
  final String password;

  PasswordChanged({this.password});

  @override  
  List<Object> get props => [password];  

  @override
  String toString() {
    return 'PasswordChanged{password: $password}';    
  }
}

class LoginWithGoogleButton extends LoginEvent {}

class LoginWithCredentials extends LoginEvent{
  final String email, password;

  LoginWithCredentials({this.email, this.password});

  @override  
  List<Object> get props => [email, password];  

  @override
  String toString() {
    return 'Submitted{email: $email, password: $password}';    
  }
}

class VerifyPhoneNumber extends LoginEvent {
  final String phoneNumber;

  VerifyPhoneNumber({this.phoneNumber});

  @override  
  List<Object> get props => [phoneNumber];  

  @override
  String toString() {
    return 'VerifyPhoneNumber{phoneNumber: $phoneNumber}';    
  }
}

class LoginWithPhoneNumber extends LoginEvent {
  final String smsCode;

  LoginWithPhoneNumber({this.smsCode});

  @override  
  List<Object> get props => [smsCode];  

  @override
  String toString() {
    return 'LoginWithPhoneNumber{smsCode: $smsCode}';    
  }
}

  class ResetPasswordWithEmail extends LoginEvent {
    final String email;

    ResetPasswordWithEmail({this.email});

    @override  
    List<Object> get props => [email];  

    @override
    String toString() {
      return 'ResetPasswordWithEmail{email: $email}';    
    }
  }


