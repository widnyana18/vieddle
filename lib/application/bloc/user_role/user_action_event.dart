part of 'user_action_bloc.dart';

class UserActionEvent extends Equatable{
  @override  
  List<Object> get props => [];  
}

class SelectUserRole extends UserActionEvent{
  SelectUserRole({this.role});  
  final String role;

  @override  
  List<Object> get props => [role];   
}
