import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vieddle/application/bloc/blocs.dart';
import 'package:vieddle/utils/messages/errors.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterForm> {
  UserActionBloc _userActionBloc;
  RegisterBloc _registerBloc;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pswController = TextEditingController();
  TextEditingController _confirmPswController = TextEditingController();
  bool isLogin = false;
  bool isShowPsw = true;
  bool isShowConfirmPsw = true;

  bool get isHasValue =>
      _emailController.text.isNotEmpty &&
      _pswController.text.isNotEmpty &&
      _confirmPswController.text.isNotEmpty;

  bool isEmailValid(RegisterState state) {
    return _emailController.text.isNotEmpty && state.isEmailValid;
  }

  bool isPasswordValid(RegisterState state) {
    return _pswController.text.isNotEmpty && state.isPasswordValid;
  }

  bool isConfirmPswValid(RegisterState state) {
    return _confirmPswController.text.isNotEmpty && state.isConfirmPswValid;
  }

  bool isSignUpBtnEnabled(RegisterState state) {
    return isHasValue && !state.isSubmitting && state.isFormValid;
  }

  @override
  void initState() {
    _userActionBloc = BlocProvider.of<UserActionBloc>(context);
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _pswController.addListener(_onPswChanged);
    _confirmPswController.addListener(_onConfirmPswChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.errorCode)));
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(SignIn());
          _emailController.text = '';
          _pswController.text = '';
          _confirmPswController.text = '';
        }
      },
      builder: (context, state) {
        if (state.isSubmitting) {
          return loadingScreen();
        } else if (state.isSuccess) {
          return successLoginDialog();
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Sign Up',
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
              autovalidate: true,
              keyboardType: TextInputType.emailAddress,
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
                hintText: '123Dino&mania',
                suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    iconSize: 15,
                    onPressed: _togglePassword),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _confirmPswController,
              autovalidate: true,
              obscureText: !isShowConfirmPsw ? false : true,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'This Field must not be null';
                }
                if (!state.isConfirmPswValid) {
                  return CustomErrorMessage.ERROR_PASSWORD_NOT_MATCH;
                }
                return null;
              },
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                enabled: isConfirmPswValid(state) ? true : false,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.2)),
                contentPadding: EdgeInsets.all(8),
                suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    iconSize: 15,
                    onPressed: _toggleConfirmPsw),
                labelText: 'Resend Password',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 90),
              onPressed: _onFormSubmitted,
              color: Color(0xFFA5668B),
              child: Text(
                'Sign Up',
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
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pswController.dispose();
    _confirmPswController.dispose();
    super.dispose();
  }

  void _togglePassword() {
    setState(() => !isShowPsw ? isShowPsw = true : isShowPsw = false);
  }

  void _toggleConfirmPsw() {
    setState(() =>
        !isShowConfirmPsw ? isShowConfirmPsw = true : isShowConfirmPsw = false);
  }

  void _onEmailChanged() {
    _registerBloc.add(EmailRegisterChanged(email: _emailController.text));
  }

  void _onPswChanged() {
    _registerBloc.add(PasswordRegisterChanged(password: _pswController.text));
  }

  void _onBackToLogin() {
    _userActionBloc.add(SelectUserRole(role: 'EmailPasswordSignIn'));
  }

  void _onConfirmPswChanged() {
    _registerBloc.add(ConfirmPasswordChanged(
        password: _pswController.text,
        confirmPassword: _confirmPswController.text));
  }

  void _onFormSubmitted() {
    _registerBloc.add(Submitted(
        email: _emailController.text,
        confirmPassword: _confirmPswController.text));
  }

  Widget loadingScreen() {
    return SizedBox(
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Creating Account....'),
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
          'Success To Sign Up',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

// class OptionalForm extends StatefulWidget {
//   @override
//   _OptionalFormState createState() => _OptionalFormState();
// }

// class _OptionalFormState extends State<OptionalForm> {
//   TextEditingController _nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         InkWell(
//           onTap: () {},
//           child: Container(
//             width: 80,
//             height: 80,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/person.jpg'),
//                 fit: BoxFit.cover,
//                 repeat: ImageRepeat.noRepeat,
//               ),
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//         SizedBox(height: 15),
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 15.0),
//           child: TextFormField(
//             controller: _nameController,
//             autovalidate: true,
//             keyboardType: TextInputType.text,
//             style: TextStyle(fontSize: 15),
//             decoration: InputDecoration(
//               enabled: _nameController.text.isNotEmpty ? true : false,
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue, width: 1.2)),
//               border: UnderlineInputBorder(),
//               contentPadding: EdgeInsets.all(8),
//               labelText: 'UserName',
//             ),
//           ),
//         ),
//         SizedBox(height: 15),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {},
//             ),
//             RaisedButton(
//               shape: StadiumBorder(),
//               onPressed: _onFormSubmitted,
//               color: Color(0xFf0E103D),
//               child: Text(
//                 'Next',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: 'OpenSans',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   void _onFormSubmitted() {}
// }

// class RegisterNumberPhone extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _phoneController = TextEditingController();

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 15.0),
//           child: TextFormField(
//             controller: _phoneController,
//             autovalidate: true,
//             keyboardType: TextInputType.phone,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'This Field must not be null';
//               }
//               return null;
//             },
//             style: TextStyle(fontSize: 15),
//             decoration: InputDecoration(
//               enabled: _phoneController.text.isNotEmpty ? true : false,
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue, width: 1.2)),
//               border: UnderlineInputBorder(),
//               contentPadding: EdgeInsets.all(8),
//               labelText: 'Phone Number',
//             ),
//           ),
//         ),
//         SizedBox(height: 15),
//         RaisedButton(
//           shape: StadiumBorder(),
//           onPressed: () {},
//           color: Color(0xFf0E103D),
//           child: Text(
//             'Verify Account',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//               fontWeight: FontWeight.w500,
//               fontFamily: 'OpenSans',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
