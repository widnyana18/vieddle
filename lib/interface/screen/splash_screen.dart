import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vieddle/application/bloc/authentication/authentication_bloc.dart';
import 'package:vieddle/interface/screen/content/content_overview.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ContentOverview();
        },
      ),
    );
  }
}
