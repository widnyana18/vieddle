part of 'login_bloc.dart';

@immutable
class LoginState{  
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isFailure;
  final bool isSuccess;        
  final String errorCode;

  bool get isFormValid => isEmailValid && isPasswordValid;


  LoginState({
    @required this.isEmailValid,
    @required this.isPasswordValid,        
    @required this.isSubmitting,
    @required this.isFailure,
    @required this.isSuccess,
    @required this.errorCode
  });
  

  factory LoginState.empty(){
    return LoginState(
      isEmailValid : true,
      isPasswordValid : true,            
      isSubmitting : false,
      isFailure : false,
      isSuccess : false,
      errorCode: ''
    );
  }    

  factory LoginState.loading(){
    return LoginState(
      isEmailValid : true,
      isPasswordValid : true,            
      isSubmitting : true,
      isFailure : false,
      isSuccess : false,
      errorCode: ''
    );
  }

  factory LoginState.success(){
    return LoginState(
      isEmailValid : true,
      isPasswordValid : true,            
      isSubmitting : false,
      isFailure : false,
      isSuccess : true,
      errorCode: ''
    );
  }

  factory LoginState.failure(String errorCode){
    return LoginState(
      isEmailValid : true,
      isPasswordValid : true,            
      isSubmitting : false,
      isFailure : true,
      isSuccess : false,
      errorCode: errorCode
    );
  }

  LoginState update({
    bool isEmailValid, 
    bool isPasswordValid,        
  }){
   return copyWith( 
    isEmailValid : isEmailValid,
    isPasswordValid : isPasswordValid,        
    isSubmitting : false,
    isFailure : false,
    isSuccess : false,
    errorCode: ''
   );    
  }

  LoginState copyWith({
    bool isEmailValid, 
    bool isPasswordValid,        
    bool isSubmitting, 
    bool isFailure,
    bool isSuccess,
    String errorCode
  }){ 
   return LoginState( 
    isEmailValid : isEmailValid ?? this.isEmailValid,
    isPasswordValid : isPasswordValid ?? this.isPasswordValid,        
    isSubmitting : isSubmitting ?? this.isSubmitting,
    isFailure : isFailure ?? this.isFailure,
    isSuccess : isSuccess ?? this.isSuccess,
    errorCode: errorCode ?? this.errorCode    
   );    
  } 

   @override
    String toString() {
      return '''LoginState {
        isEmailValid: $isEmailValid,
        isPasswordValid: $isPasswordValid,                      
        isSubmitting: $isSubmitting,
        isSuccess: $isSuccess,
        isFailure: $isFailure,
        errorCode: $errorCode
      }''';
    }
}
