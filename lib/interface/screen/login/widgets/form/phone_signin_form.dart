import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vieddle/application/bloc/blocs.dart';

class PhoneSignInForm extends StatefulWidget {
  static String phoneNumber;

  @override
  _PhoneSignInFormState createState() => _PhoneSignInFormState();
}

class _PhoneSignInFormState extends State<PhoneSignInForm> {
  TextEditingController _phoneController;
  UserActionBloc _userActionBloc;

  @override
  void initState() {
    super.initState();
    _userActionBloc = BlocProvider.of<UserActionBloc>(context);
    _phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: TextFormField(
            controller: _phoneController,
            autovalidate: true,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value.isEmpty) {
                return 'This Field must not be null';
              }
              return null;
            },
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
              enabled: _phoneController.text.isNotEmpty ? true : false,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.2)),
              contentPadding: EdgeInsets.all(8),
              labelText: 'Phone Number',
            ),
          ),
        ),
        SizedBox(height: 15),
        RaisedButton(
          shape: StadiumBorder(),
          onPressed:
              _phoneController.text.isNotEmpty ? _onSubmittedPhoneNumber : null,
          color: Color(0xFFA5668B),
          child: Text(
            'Confirm Phone Number',
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
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onSubmittedPhoneNumber() {
    setState(() => PhoneSignInForm.phoneNumber = _phoneController.text);
    _userActionBloc.add(SelectUserRole(role: 'VerifySmsCode'));
  }
}

class PhoneVerifyCode extends StatefulWidget {
  final String phoneNumber;
  PhoneVerifyCode({@required this.phoneNumber});

  @override
  _PhoneVerifyCode createState() => _PhoneVerifyCode();
}

class _PhoneVerifyCode extends State<PhoneVerifyCode> {
  LoginBloc _loginBloc;
  TextEditingController _codeController;
  bool onHover = false;

  @override
  void initState() {
    super.initState();
    print(widget.phoneNumber);
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _loginBloc.add(VerifyPhoneNumber(phoneNumber: widget.phoneNumber));
    _codeController = TextEditingController();
  }

  bool isformValid(LoginState state) =>
      _codeController.text.isNotEmpty &&
      _codeController.text.length == 6 &&
      !state.isSubmitting;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.isFailure) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(state.errorCode),
            ),
          );
      }

      if (state.isSuccess) {
        BlocProvider.of<AuthenticationBloc>(context).add(SignIn());
        _codeController.text = '';
      }
    }, builder: (context, state) {
      if (state.isSubmitting) {
        return loadingScreen();
      } else if (state.isSuccess) {
        return successLoginDialog();
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 15),
          TextFormField(
            controller: _codeController,
            smartDashesType: SmartDashesType.enabled,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'This Field must not be null';
              } else if (value.length != 6) {
                return 'Length of Code must 6 Number';
              }
              return null;
            },
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
                enabled: _codeController.text.isNotEmpty ? true : false,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.2)),
                contentPadding: EdgeInsets.all(8),
                labelText: 'Token Code',
                helperText: 'Check SMS Code on Your Phone'),
          ),
          SizedBox(height: 15),
          RaisedButton(
            shape: StadiumBorder(),
            onPressed: !isformValid(state) ? _onConfirmCode : null,
            color: Color(0xFFA5668B),
            child: Text(
              'Send Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
          SizedBox(height: 15),
          Text('Failed to Retrived SMS Code ?', style: TextStyle(fontSize: 11)),
          MouseRegion(
            onHover: (e) => _mouseEnter(true),
            onExit: (e) => _mouseEnter(false),
            child: InkWell(
              onTap: _onResendPhoneNumber,
              child: Text(
                'Resend Phone Number',
                style: TextStyle(
                  fontSize: 11,
                  color: onHover == true ? Color(0xFFA5668B) : Colors.black38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _mouseEnter(bool hover) {
    setState(() => onHover = hover);
  }

  void _onConfirmCode() {
    _loginBloc.add(LoginWithPhoneNumber(smsCode: _codeController.text));
  }

  void _onResendPhoneNumber() {
    BlocProvider.of<UserActionBloc>(context)
        .add(SelectUserRole(role: 'NumberPhoneSignIn'));
    _codeController.text = '';
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
