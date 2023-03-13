import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:vieddle/infrastructure/repository/user_repository/user_repository.dart';
import 'package:vieddle/utils/validator/validator.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(
    Stream<RegisterEvent> events,
    TransitionFunction<RegisterEvent, RegisterState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailRegisterChanged &&
          event is! PasswordRegisterChanged &&
          event is! ConfirmPasswordChanged);
    }).debounceTime(Duration(milliseconds: 2));
    final debounceStream = events.where((event) {
      return (event is EmailRegisterChanged ||
          event is PasswordRegisterChanged ||
          event is ConfirmPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is EmailRegisterChanged) {
      yield* _mapEmailChangedtoState(event.email);
    } else if (event is PasswordRegisterChanged) {
      yield* _mapPasswordChangedtoState(event.password);
    } else if (event is ConfirmPasswordChanged) {
      yield* _mapConfirmPasswordChangedtoState(
          event.password, event.confirmPassword);
    } else if (event is Submitted) {
      yield* _mapSubmittedtoState(event.email, event.confirmPassword);
    }
  }

  Stream<RegisterState> _mapEmailChangedtoState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<RegisterState> _mapPasswordChangedtoState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<RegisterState> _mapConfirmPasswordChangedtoState(
      String password, String confirmPassword) async* {
    yield state.update(
        isConfirmPswValid:
            Validators.isMatchPassword(password, confirmPassword));
  }

  Stream<RegisterState> _mapSubmittedtoState(
      String email, String confirmPassword) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(email: email, password: confirmPassword);
      yield RegisterState.success();
      final user = (await _userRepository.getUser()).email;
      print('currentuser $user');
    } catch (e) {
      yield RegisterState.failure(e.toString());
    } finally {
      _userRepository.sendEmail();
    }
  }
}
