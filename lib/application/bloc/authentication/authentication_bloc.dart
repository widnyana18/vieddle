import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:vieddle/infrastructure/repository/user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<Transition<AuthenticationEvent, AuthenticationState>> transformEvents(
    Stream<AuthenticationEvent> events,
    TransitionFunction<AuthenticationEvent, AuthenticationState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! SignIn);
    });
    final debounceStream = events.where((event) {
      return (event is SignIn);
    }).debounceTime(Duration(seconds: 1));

    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedtoState();
    } else if (event is SignIn) {
      yield* _mapSignIntoState();
    } else if (event is SignOut) {
      yield* _mapSignOuttoState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedtoState() async* {
    final userExist = await _userRepository.isSignIn();
    // final currentUser = await _userRepository.getUser();

    try {
      if (userExist) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Uninitialized();
    }
  }

  Stream<AuthenticationState> _mapSignIntoState() async* {
    print(_userRepository.mapUserData());
    yield Authenticated();
  }

  Stream<AuthenticationState> _mapSignOuttoState() async* {
    await _userRepository.signOut();
    yield Unauthenticated();
  }
}
