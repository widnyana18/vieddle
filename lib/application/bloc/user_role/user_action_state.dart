part of 'user_action_bloc.dart';

enum UserRole {
  EMAIL_PASSWORD_SIGNIN,
  GOOGLE_SIGNIN,
  NUMBER_PHONE_SIGNIN,
  VERIFY_SMS_CODE,
  FORGET_PASSWORD,
  SIGNUP,
  UPDATE_EMAIL,
  UPDATE_PASSWORD,
  UPDATE_PROFILE,
  DELETE_ACCOUNT
}

class UserActionState {  
  final UserRole userAction;
  UserActionState({@required this.userAction});

  factory UserActionState.fromIndex(int idx){
    return UserActionState(userAction: UserRole.values[idx]);
  }

  @override
  String toString() {
    return 'User Action : $userAction';    
  } 
}