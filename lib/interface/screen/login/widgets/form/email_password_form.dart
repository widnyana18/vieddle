import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vieddle/application/bloc/blocs.dart';

import 'package:vieddle/utils/messages/errors.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _pswController = TextEditingController();

class EmailPasswordForm extends StatefulWidget {
  @override
  _EmailPasswordState createState() => _EmailPasswordState();
}

class _EmailPasswordState extends State<EmailPasswordForm> {
  UserActionBloc _userActionBloc;
  LoginBloc _loginBloc;
  int stateHover = 0;
  bool isShowPsw = true;

  void _mouseEnter(int hover) {
    setState(() => stateHover = hover);
  }

  bool get isHasValue =>
      _emailController.text.isNotEmpty && _pswController.text.isNotEmpty;

  bool isEmailValid(LoginState state) {
    return _emailController.text.isNotEmpty && state.isEmailValid;
  }

  bool isPasswordValid(LoginState state) {
    return _pswController.text.isNotEmpty && state.isPasswordValid;
  }

  bool isLoginBtnEnabled(LoginState state) {
    return isHasValue && !state.isSubmitting && state.isFormValid;
  }

  @override
  void initState() {
    _userActionBloc = BlocProvider.of<UserActionBloc>(context);
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _pswController.addListener(_onPswChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.errorCode),
            ));
        }

        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(SignIn());
          _emailController.text = '';
          _pswController.text = '';
        }
      },
      builder: (context, state) {
        if (state.isSubmitting) {
          return loadingScreen();
        } else if (state.isSuccess) {
          return successLoginDialog();
        }

        return Column(
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _pswController,
              autovalidate: true,
              keyboardType: TextInputType.visiblePassword,
              obscureText: !isShowPsw ? false : true,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'This Field must not be null';
                }
                if (!state.isPasswordValid) {
                  return CustomErrorMessage.ERROR_PASSWORD_WRONG;
                }
                return null;
              },
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                enabled: isPasswordValid(state) ? true : false,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.2)),
                contentPadding: EdgeInsets.all(8),
                labelText: 'Password',
                helperText:
                    'Password must has min 8 character, \n capital, numeric and symbol',
                hintText: '123Dino&mania',
                suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    iconSize: 15,
                    onPressed: _togglePassword),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                MouseRegion(
                  onHover: (e) => _mouseEnter(1),
                  onExit: (e) => _mouseEnter(-1),
                  child: InkWell(
                    onTap: _onForgetPassword,
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(
                          fontSize: 10,
                          color: stateHover == 1
                              ? Color(0xFFA5668B)
                              : Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                MouseRegion(
                  onHover: (e) => _mouseEnter(2),
                  onExit: (e) => _mouseEnter(-1),
                  child: InkWell(
                    onTap: _onSignUp,
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'OpenSans',
                        color:
                            stateHover == 2 ? Color(0xFFA5668B) : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              shape: StadiumBorder(),
              onPressed: isLoginBtnEnabled(state) ? _onFormSubmitted : null,
              padding: EdgeInsets.symmetric(horizontal: 100),
              color: Color(0xFFA5668B),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'OpenSans'),
              ),
            ),
            SizedBox(height: 20),
            Container(
                color: Colors.white,
                child: Divider(height: .5, color: Colors.black12)),
            SizedBox(height: 15),
            PhoneNumberSignInButton(),
            GoogleSignInButton(),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pswController.dispose();
    super.dispose();
  }

  void _togglePassword() {
    setState(() => !isShowPsw ? isShowPsw = true : isShowPsw = false);
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onForgetPassword() {
    _userActionBloc.add(SelectUserRole(role: 'ForgetPassword'));
  }

  void _onSignUp() {
    _userActionBloc.add(SelectUserRole(role: 'SignUp'));
    _emailController.text = '';
    _pswController.text = '';
  }

  void _onPswChanged() {
    _loginBloc.add(PasswordChanged(password: _pswController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentials(
        email: _emailController.text,
        password: _pswController.text,
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
          'Success To Login',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class PhoneNumberSignInButton extends StatefulWidget {
  @override
  _PhoneNumberSignInButtonState createState() =>
      _PhoneNumberSignInButtonState();
}

class _PhoneNumberSignInButtonState extends State<PhoneNumberSignInButton> {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: _onSubmitNumberPhone,
      padding: EdgeInsets.symmetric(horizontal: 20),
      borderSide: BorderSide(width: 1, color: Color(0xFF609CE1)),
      shape: StadiumBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Login with ',
            style: TextStyle(
              color: Color(0xFF236AB9),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.phone,
            color: Color(0xFF236AB9),
            size: 18,
          ),
        ],
      ),
    );
  }

  void _onSubmitNumberPhone() {
    BlocProvider.of<UserActionBloc>(context)
        .add(SelectUserRole(role: 'NumberPhoneSignIn'));
    _emailController.text = '';
    _pswController.text = '';
  }
}

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: _onSubmitGoogleSignIn,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xFFCC3333),
      shape: StadiumBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Login with ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(width: 10),
          Image.asset(
            'google.png',
            repeat: ImageRepeat.noRepeat,
            alignment: Alignment.center,
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }

  void _onSubmitGoogleSignIn() {
    BlocProvider.of<LoginBloc>(context).add(LoginWithGoogleButton());
  }
}
