import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vieddle/application/bloc/blocs.dart';
import 'package:vieddle/utils/messages/custom_error.dart';

class ResetPasswordForm extends StatefulWidget {
  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  LoginBloc _loginBloc;
  TextEditingController _emailController = TextEditingController();

  bool isEmailValid(LoginState state) {
    return _emailController.text.isNotEmpty && state.isEmailValid;
  }

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.isFailure) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(state.errorCode),
          ));
      }

      if (state.isSuccess) {
        BlocProvider.of<UserActionBloc>(context)
            .add(SelectUserRole(role: 'EmailPasswordSignIn'));
        _emailController.text = '';
      }
    }, builder: (context, state) {
      if (state.isSubmitting) {
        return loadingScreen();
      } else if (state.isSuccess) {
        return successLoginDialog();
      }

      return Column(
        children: <Widget>[
          Text(
            'Reset Password',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'This Field must not be null';
                }
                if (!state.isEmailValid) {
                  return CustomErrorMessage.ERROR_INVALID_EMAIL;
                }
                return null;
              },
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                enabled: isEmailValid(state) ? true : false,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.2)),
                contentPadding: EdgeInsets.all(8),
                labelText: 'Email',
                hintText: 'xxx@example.com',
              ),
            ),
          ),
          SizedBox(height: 15),
          RaisedButton(
            shape: StadiumBorder(),
            onPressed: !state.isSubmitting && isEmailValid(state)
                ? _onFormSubmitted
                : null,
            color: Color(0xFFA5668B),
            child: Text(
              'Send Reset Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      ResetPasswordWithEmail(
        email: _emailController.text,
      ),
    );
  }

  Widget loadingScreen() {
    return SizedBox(
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Authenticating Account'),
          SizedBox(
            height: 15,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget successLoginDialog() {
    return SizedBox(
      height: 350,
      child: Center(
        child: Text(
          'Success To Send Email',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
