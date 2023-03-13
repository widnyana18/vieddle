import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:vieddle/infrastructure/repository/user_repository/user_repository.dart';
import 'package:vieddle/utils/validator/validator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
    Stream<LoginEvent> events,
    TransitionFunction<LoginEvent, LoginState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    }).debounceTime(Duration(seconds: 2));
    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedtoState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedtoState(event.password);
    } else if (event is LoginWithGoogleButton) {
      yield* _mapLoginWithGoogletoState();
    } else if (event is LoginWithCredentials) {
      yield* _mapLoginWithCredentialstoState(
          email: event.email, password: event.password);
    } else if (event is VerifyPhoneNumber) {
      yield* _mapVerifyPhoneNumbertoState(event.phoneNumber);
    } else if (event is LoginWithPhoneNumber) {
      yield* _mapLoginWithPhoneNumbertoState(event.smsCode);
    } else if (event is ResetPasswordWithEmail) {
      yield* _mapResetPasswordWithEmailtoState(event.email);
    }
  }

  Stream<LoginState> _mapEmailChangedtoState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<LoginState> _mapPasswordChangedtoState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<LoginState> _mapLoginWithGoogletoState() async* {
    yield LoginState.loading();
    try {
      await _userRepository.signInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure('');
    }
  }

  Stream<LoginState> _mapLoginWithCredentialstoState(
      {String email, String password}) async* {
    // final name = (await _userRepository.getUser()).displayName;
    yield LoginState.loading();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginState.success();
      // print(name);
    } catch (error) {
      yield LoginState.failure(error.toString());
    }
  }

  Stream<LoginState> _mapVerifyPhoneNumbertoState(String phoneNumber) async* {
    try {
      await _userRepository.onVerifyCode(phoneNumber);
    } catch (error) {
      yield LoginState.failure(error.toString());
    }
  }

  Stream<LoginState> _mapLoginWithPhoneNumbertoState(String smsCode) async* {
    yield LoginState.loading();
    try {
      await _userRepository.signInWithPhoneNumber(smsCode);
      yield LoginState.success();
    } catch (error) {
      yield LoginState.failure(error.toString());
    }
  }

  Stream<LoginState> _mapResetPasswordWithEmailtoState(String email) async* {
    try {
      await _userRepository.resetPasswordWithEmail(email);
      yield LoginState.success();
    } catch (error) {
      yield LoginState.failure(error.toString());
    }
  }
}
