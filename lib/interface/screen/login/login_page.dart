import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vieddle/application/bloc/blocs.dart';
import 'package:vieddle/infrastructure/data_transport.dart';
import 'package:vieddle/infrastructure/repository/user_repository/user_repository.dart';
import 'package:vieddle/interface/screen/login/widgets/form/forms.dart';
import 'package:vieddle/interface/util/responsiveLayout.dart';

class LoginPage extends StatelessWidget {
  LoginPage({this.userRepository});
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TransportUserData _userData = TransportUserData.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LoginBloc(userRepository: _userData.userRepository),
        ),
        BlocProvider(
          create: (context) =>
              RegisterBloc(userRepository: _userData.userRepository),
        ),
      ],
      child: BlocBuilder<UserActionBloc, UserActionState>(
        builder: (context, state) {
          return ResponsiveLayout(
            largeScreen: Dialog(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  width: size.width * .32,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      state.userAction != UserRole.EMAIL_PASSWORD_SIGNIN
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 10),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  return _backToLogin(context);
                                },
                              ),
                            )
                          : SizedBox.shrink(),
                      transformWidget(state.userAction),
                    ],
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            smallScreen: Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: transformWidget(state.userAction),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget transformWidget(UserRole role) {
    switch (role) {
      case UserRole.SIGNUP:
        return RegisterForm();
        break;

      case UserRole.NUMBER_PHONE_SIGNIN:
        return PhoneSignInForm();
        break;

      case UserRole.FORGET_PASSWORD:
        return ResetPasswordForm();
        break;

      case UserRole.VERIFY_SMS_CODE:
        return PhoneVerifyCode(
          phoneNumber: PhoneSignInForm.phoneNumber,
        );
        break;

      default:
        return EmailPasswordForm();
        break;
    }
  }

  void _backToLogin(BuildContext context) {
    BlocProvider.of<UserActionBloc>(context)
        .add(SelectUserRole(role: 'EmailPasswordSignIn'));
  }
}
