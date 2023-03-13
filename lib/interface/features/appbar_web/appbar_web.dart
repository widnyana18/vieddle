import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vieddle/application/bloc/blocs.dart';
import 'package:vieddle/interface/features/appbar_web/profile_bar_commponent.dart';
import 'package:vieddle/interface/features/widgets.dart';
import 'package:vieddle/interface/screen/login/login_page.dart';

class AppBarWeb extends StatefulWidget {
  AppBarWeb({this.bgColor = Colors.white, this.height = 60, this.bottomWidget});

  final Color bgColor;
  final double height;
  final Widget bottomWidget;

  @override
  _AppBarWebState createState() => _AppBarWebState();
}

class _AppBarWebState extends State<AppBarWeb> {
  Color get getColor =>
      widget.bgColor == Colors.white ? Colors.black : Colors.white;
  Color get getBgColor =>
      widget.bgColor == Colors.white ? Color(0xFFF3F3F3) : Color(0xFF4B253C);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: widget.height,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavBar(
              color: getColor,
            ),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return AccountProfile(
                    bgColor: getBgColor,
                  );
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: LoginButton(text: 'Login', onPressed: _openLogin),
                );
              },
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(background: widget.bottomWidget),
      backgroundColor: widget.bgColor,
      floating: true,
    );
  }

  void _openLogin() {
    showDialog(
      context: context,
      builder: (_) => LoginPage(),
    ).whenComplete(
      () => BlocProvider.of<UserActionBloc>(context).add(
        SelectUserRole(role: 'EmailPasswordSignIn'),
      ),
    );
  }

  // void _clickLogOut() {
  //   BlocProvider.of<AuthenticationBloc>(context).add(SignOut());
  //   showDialog(
  //     context: context,
  //     builder: (_) => LogOutAlert(),
  //   );
  // }
}
