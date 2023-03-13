class ErrorCodes {

  static const String ERROR_C0DE_NETWORK_ERROR = "FirebaseException";
  static const String ERROR_USER_NOT_FOUND = "ERROR_USER_NOT_FOUND";
  static const String ERROR_TOO_MANY_REQUESTS = "ERROR_TOO_MANY_REQUESTS";
  static const String ERROR_INVALID_EMAIL = "ERROR_INVALID_EMAIL";
  static const String ERROR_CODE_USER_DISABLED = "ERROR_CODE_USER_DISABLED";
  static const String ERROR_CODE_WRONG_PASSWORD = "ERROR_CODE_WRONG_PASSWORD";
  static const String ERROR_CODE_EMAIL_ALREADY_IN_USE = "ERROR_CODE_EMAIL_ALREADY_IN_USE";
  static const String ERROR_OPERATION_NOT_ALLOWED = "ERROR_OPERATION_NOT_ALLOWED";
  static const String ERROR_CODE_WEAK_PASSWORD = "ERROR_CODE_WEAK_PASSWORD";
}

class ErrorMessages {
  
  static const String ERROR_C0DE_NETWORK_ERROR = "Network Error! Check internet connection.";
  static const String ERROR_USER_NOT_FOUND = "User Not Found!";
  static const String ERROR_TOO_MANY_REQUESTS = "Too Many Requests!";
  static const String ERROR_INVALID_EMAIL = "Invalid Email!";
  static const String ERROR_CODE_USER_DISABLED = "User is Banned!";
  static const String ERROR_CODE_WRONG_PASSWORD = "Wrong Password!";
  static const String ERROR_CODE_EMAIL_ALREADY_IN_USE = "This email is already in use!";
  static const String ERROR_OPERATION_NOT_ALLOWED = "Operation not allowed";
  static const String ERROR_CODE_WEAK_PASSWORD = "Weak password!";
  static const String DEFAULT = "Unknown error!";
}


class GenerateMessageCode{
  
  String authError = '';
  
  Future<String> errorCode(String code) async{
    switch (code) {
      case ErrorCodes.ERROR_C0DE_NETWORK_ERROR:
        authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
        break;
      case ErrorCodes.ERROR_USER_NOT_FOUND:
        authError = ErrorMessages.ERROR_USER_NOT_FOUND;
        break;
      case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
        authError = ErrorMessages.ERROR_TOO_MANY_REQUESTS;
        break;
      case ErrorCodes.ERROR_INVALID_EMAIL:
        authError = ErrorMessages.ERROR_INVALID_EMAIL;
        break;
      case ErrorCodes.ERROR_CODE_USER_DISABLED:
        authError = ErrorMessages.ERROR_CODE_USER_DISABLED;
        break;
      case ErrorCodes.ERROR_CODE_WRONG_PASSWORD:
        authError = ErrorMessages.ERROR_CODE_WRONG_PASSWORD;
        break;
      case ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
        authError = ErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
        break;
      case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
        authError = ErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
        break;
      case ErrorCodes.ERROR_CODE_WEAK_PASSWORD:
        authError = ErrorMessages.ERROR_CODE_WEAK_PASSWORD;
        break;
      default:
        authError = ErrorMessages.DEFAULT;
        break;
    }     
    return authError;
  } 
}