import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_action_event.dart';
part 'user_action_state.dart';

class UserActionBloc extends Bloc<UserActionEvent, UserActionState> {
  @override
  UserActionState get initialState => UserActionState(userAction: UserRole.EMAIL_PASSWORD_SIGNIN);

  @override
  Stream<UserActionState> mapEventToState(
    UserActionEvent event,
  ) async* {
   if(event is SelectUserRole){
     yield* _mapSelectUserRoleToState(event.role); 
   }

}
   Stream<UserActionState> _mapSelectUserRoleToState(String role) async*{     
      switch(role){
        case 'EmailPasswordSignIn': 
          yield UserActionState.fromIndex(0);
          break;
        case 'GoogleSignIn': 
          yield UserActionState.fromIndex(1);
          break;
        case 'NumberPhoneSignIn': 
          yield UserActionState.fromIndex(2);
          break;
        case 'VerifySmsCode': 
          yield UserActionState.fromIndex(3);
          break;
        case 'ForgetPassword': 
          yield UserActionState.fromIndex(4);
          break;
        case 'SignUp': 
          yield UserActionState.fromIndex(5);
          break;
        case 'UpdateEmail': 
          yield UserActionState.fromIndex(6);
          break;
        case 'UpdatePassword': 
          yield UserActionState.fromIndex(7);
          break;
        case 'UpdateProfile': 
          yield UserActionState.fromIndex(8);
          break;
        case 'DeleteAccount': 
          yield UserActionState.fromIndex(9);
          break;
        default: 
          print('404');
          break;
      }
   }
}