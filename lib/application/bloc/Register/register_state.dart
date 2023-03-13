part of 'register_bloc.dart';

@immutable
class RegisterState{
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isConfirmPswValid;
  final bool isSubmitting;
  final bool isFailure;
  final bool isSuccess;          
  final String errorCode;
    
  bool get isFormValid => isEmailValid && isPasswordValid && isConfirmPswValid;

  RegisterState({        
    @required this.isEmailValid,
    @required this.isPasswordValid,        
    @required this.isConfirmPswValid,
    @required this.isSubmitting,
    @required this.isFailure,
    @required this.isSuccess,    
    this.errorCode
  });  

  factory RegisterState.empty(){
    return RegisterState(          
      isEmailValid : true,
      isPasswordValid : true,            
      isConfirmPswValid : true,
      isSubmitting : false,
      isFailure : false,
      isSuccess : false,                                 
    );
  }    

  factory RegisterState.loading(){
    return RegisterState(
      isEmailValid : true,
      isPasswordValid : true,            
      isConfirmPswValid: true,
      isSubmitting : true,
      isFailure : false,
      isSuccess : false,            
    );
  }

  factory RegisterState.success(){
    return RegisterState(  
      isEmailValid : true,
      isPasswordValid : true,            
      isConfirmPswValid : true,
      isSubmitting : false,
      isFailure : false,
      isSuccess : true,           
    );
  }

  factory RegisterState.failure(String errorCode){
    return RegisterState(
      isEmailValid : true,
      isPasswordValid : true,            
      isConfirmPswValid : true,
      isSubmitting : false,
      isFailure : true,
      isSuccess : false,      
      errorCode : errorCode
    );
  }

  RegisterState update({    
    String name,    
    bool isEmailValid, 
    bool isPasswordValid,        
    bool isConfirmPswValid
  }){
   return copyWith(     
    isEmailValid : isEmailValid,
    isPasswordValid : isPasswordValid,        
    isConfirmPswValid : isConfirmPswValid,
    isSubmitting : false,
    isFailure : false,
    isSuccess : false,    
   );    
  }

  RegisterState copyWith({        
    bool isEmailValid, 
    bool isPasswordValid,        
    bool isConfirmPswValid,
    bool isSubmitting, 
    bool isFailure,
    bool isSuccess,    
  }){ 
   return RegisterState(     
    isEmailValid : isEmailValid ?? this.isEmailValid,
    isPasswordValid : isPasswordValid ?? this.isPasswordValid,        
    isConfirmPswValid: isConfirmPswValid ?? this.isConfirmPswValid,
    isSubmitting : isSubmitting ?? this.isSubmitting,
    isFailure : isFailure ?? this.isFailure,
    isSuccess : isSuccess ?? this.isSuccess,      
   );    
  } 

   @override
    String toString() {
      return '''LoginState {        
        isEmailValid: $isEmailValid,
        isPasswordValid: $isPasswordValid, 
        isConfirmPswValid: $isConfirmPswValid,                     
        isSubmitting: $isSubmitting,
        isSuccess: $isSuccess,        
        isFailure: $isFailure,
        errorCode : $errorCode
      }''';
    }
}
